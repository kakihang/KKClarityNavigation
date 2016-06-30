//
//  KKInfoModel.m
//  健康医药咨询测试AP简易展示
//
//  Created by kaki on 16/6/30.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKInfoModel.h"

@implementation KKInfoModel

- (NSArray *)infos {
    if(_infos == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tngou" ofType:@"plist"];
        _infos = [NSArray arrayWithContentsOfFile:path];
    }
    return _infos;
}

- (NSArray *)headTitles {
    if(_headTitles == nil) {
        _headTitles = @[@"健康API接口", @"医疗API接口", @"生活API接口", @"农业API接口"];
    }
    return _headTitles;
}

static KKInfoModel *infoModel_ = nil;
+ (instancetype)shareInfo {
    if (!infoModel_) {
        @synchronized (self) {
            if (!infoModel_) {
                infoModel_ = [[KKInfoModel alloc] init];
            }
        }
    }
    return infoModel_;
}

@end
