//
//  IMTableViewController.m
//  Practice4
//
//  Created by Bytedance on 2020/6/17.
//  Copyright © 2020 july. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IMTableViewController.h"
#import "IMCell.h"
#import "IMModel.h"
#import <AFNetworking/AFNetworking.h>
#import <KVOController/KVOController.h>


static NSString *CellIdentifier = @"Identifier";

@interface IMTableViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *array;

//@property UITableView *tableview;

@end

@implementation IMTableViewController

#pragma -mark life circle

-(void)viewDidLoad{
    [super viewDidLoad];
    [self getData];
    [self.view addSubview:self.tableView];
    
}

- (void)getData {
    if (_array) {
        return;
    }
    __weak typeof(self) weakself = self;
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    NSURLSessionDataTask *task=[manager dataTaskWithHTTPMethod:@"GET" URLString:@"http://10.0.0.1/file/sessions.json" parameters:nil headers:nil uploadProgress:nil downloadProgress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",responseObject);
        weakself.array = [responseObject copy];
        NSLog(@"%@",weakself.array);
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself reloadData];
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    [task resume];
    
    
 //   NSData *jsonData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sessions" ofType:@"json"]];
//    _array=[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];

}

- (void)reloadData {
    if (self.array != nil) {
        _tableView.hidden = NO;
        [_tableView reloadData];
    }
}

- (void)viewSafeAreaInsetsDidChange {
    if (@available(iOS 11.0, *)) {
        self.tableView.frame = CGRectMake(0, self.view.safeAreaInsets.top, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)-self.view.safeAreaInsets.top);
    }
    [super viewSafeAreaInsetsDidChange];
}

#pragma -mark delegate


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell = [[IMCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    IMModel *model = [[IMModel alloc]initWithDictionary:_array[indexPath.row]];
    [(IMCell*)cell setModel:model];
    
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return Cell_Height;
}

#ifdef __IPHONE_11_0

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak IMTableViewController *weakself=self;

    UIContextualAction *rowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        
    }];

    UISwipeActionsConfiguration *actionsCof = [UISwipeActionsConfiguration configurationWithActions:@[rowAction]];
    actionsCof.performsFirstActionWithFullSwipe = NO;
    return actionsCof;
}

#else

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    __weak IMTableViewController *weakself=self;

    UITableViewRowAction *rowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [weakself deleteAction:indexPath];
    }];

    return @[rowAction];
}

#endif


#pragma - mark setter and getter

- (UITableView *)tableView{
    if(_tableView==nil){
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.estimatedRowHeight=Cell_Height;
        _tableView.rowHeight=UITableViewAutomaticDimension;
        _tableView.hidden = YES;
    }
    return _tableView;
}

@end
