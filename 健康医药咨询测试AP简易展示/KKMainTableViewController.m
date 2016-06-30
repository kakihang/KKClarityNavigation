//
//  KKMainTableViewController.m
//  健康医药咨询测试AP简易展示
//
//  Created by kaki on 16/6/30.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMainTableViewController.h"
#import "KKHealthViewController.h"
#import "KKInfoModel.h"


static NSString *ID = @"mainCell";

@interface KKMainTableViewController ()
/** name **/
@property (nonatomic, strong) NSArray *infos;
/** name **/
@property (nonatomic, strong) NSArray *headTitles;
@end

@implementation KKMainTableViewController

- (NSArray *)infos {
    if(_infos == nil) {
        _infos = [KKInfoModel shareInfo].infos;
    }
    return _infos;
}

- (NSArray *)headTitles {
    if(_headTitles == nil) {
        _headTitles = [KKInfoModel shareInfo].headTitles;
    }
    return _headTitles;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%s", __func__);
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.navigationItem.title = @"天狗云(Tngou.NET)API数据";
    //    self.navigationController.navigationBar.backgroundColor = [UIColor yellowColor];
    
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"SET" style:UIBarButtonItemStyleDone target:self action:@selector(setNav:)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 80;
}

- (void)setNav:(UIBarButtonItem *)item {
    NSLog(@"%s", __func__);
    
    [UINavigationBar animateWithDuration:3 animations:^{
        self.navigationController.navigationBar.alpha = 0.0;
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UINavigationBar animateWithDuration:3 animations:^{
            self.navigationController.navigationBar.alpha = 1.0;
        }];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.infos.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return ((NSArray *)self.infos[section]).count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.infos[indexPath.section][indexPath.row][@"title"];
    cell.detailTextLabel.numberOfLines = 0;
    cell.detailTextLabel.text = self.infos[indexPath.section][indexPath.row][@"detail"];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.headTitles[section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        KKHealthViewController *healthVC = [[KKHealthViewController alloc] init];
        healthVC.navTitle = self.headTitles[indexPath.section];
        healthVC.indexPath = indexPath;
        [self.navigationController pushViewController:healthVC animated:YES];
    }
}


@end
