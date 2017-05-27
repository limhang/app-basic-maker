//
//  MeViewController.m
//  TimeKiller
//
//  Created by 李明航 on 16/10/8.
//  Copyright © 2016年 李明航. All rights reserved.
//

#import "MeViewController.h"
#import "PhotoBaseWebView.h"
#import "MHNetworking.h"
#import "BaseInfoModel.h"
#import "MJExtension.h"
#import "BaseInfoTableViewCell.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) BaseInfoModel *baseInfoModel;
@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
    [self.view addSubview:self.mainTableView];
    [self getBasicData];
}

- (void)setupNav
{
    self.navigationItem.title = @"基础";

    
}

#pragma mark - ---Networking---
- (void)getBasicData
{
    NSString *httpUrl = [NSString stringWithFormat:@"%@%@",PhotoUrl,baseInfo];
//    httpUrl = [httpUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[MHNetworking share]getUrl:httpUrl WithRequestData:nil Success:^(id json) {
        self.baseInfoModel = [BaseInfoModel mj_objectWithKeyValues:json[@"datas"]];
        [self.dataSource addObjectsFromArray:self.baseInfoModel.lists];
        [self.mainTableView reloadData];
        NSLog(@"===%@",json);
//        [self.tableView setTableHeaderView:headView];
//        [self.tableView reloadData];
//        NSLog(@"查看动态的数据是:%@",self.detailModel);
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } fail:^(NSError *error) {
        NSLog(@"查看动态详情失败的原因是:%@",error);
//        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

#pragma mark -UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxxx" forIndexPath:indexPath];
    detailInfo *model = self.dataSource[indexPath.row];
//    cell.textLabel.text = model.des;
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //加载网页
    PhotoBaseWebView *vc = [[PhotoBaseWebView alloc]init];
    detailInfo *model = self.dataSource[indexPath.row];
    vc.webUrl = model.webUrl;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0;
}

#pragma mark -setter&&getter
- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _mainTableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableFooterView = [UIView new];
        [_mainTableView registerClass:[BaseInfoTableViewCell class] forCellReuseIdentifier:@"xxxx"];
    }
    return _mainTableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

@end
