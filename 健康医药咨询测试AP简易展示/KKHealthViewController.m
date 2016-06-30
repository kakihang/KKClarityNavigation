//
//  KKHealthViewController.m
//  健康医药咨询测试AP简易展示
//
//  Created by kaki on 16/6/30.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHealthViewController.h"
#import "KKTestViewController.h"

@interface KKHealthViewController ()

@end

@implementation KKHealthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.navTitle;
    self.view.backgroundColor = [UIColor yellowColor];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    KKTestViewController *test = [[KKTestViewController alloc] init];
    [self.navigationController pushViewController:test animated:YES];
}


@end
