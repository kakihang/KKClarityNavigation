//
//  KKInfoModel.h
//  健康医药咨询测试AP简易展示
//
//  Created by kaki on 16/6/30.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKInfoModel : NSObject

/** name **/
@property (nonatomic, strong) NSArray *infos;
/** name **/
@property (nonatomic, strong) NSArray *headTitles;

+ (instancetype)shareInfo;
@end
