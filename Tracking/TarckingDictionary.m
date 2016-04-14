//
//  TarckingDictionary.m
//  Tracking
//
//  Created by 付州  on 16/4/14.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import "TarckingDictionary.h"

@implementation TarckingDictionary

static NSDictionary *vcDic;
static NSDictionary *actionDic;
static NSDictionary *tableViewDic;
static NSDictionary *collectionDic;

+ (void)initialize {
    vcDic = @{
              @"ViewController" : @"首页",
              @"TableViewController" : @"测试tableView页面",
              @"CollectionViewController" : @"测试collection页面",
              };
    
    actionDic = @{
              @"ViewController_pushTableVC:_0" : @"进入测试tableView页面按钮",
              @"ViewController_pushCollectionVC:_0" : @"进入测试collection页面按钮",
                  };
    
    tableViewDic = @{
              
                     };
    
    collectionDic = @{
              @"" : @"",
                      };
}

+ (NSString *)getViewControllerIdentificationWithKey:(NSString *)key {
    return [vcDic objectForKey:key];
}

+ (NSString *)getControlIdentificationWithKey:(NSString *)key {
    return [actionDic objectForKey:key];
}

+ (NSString *)getTableViewIdentificationWithKey:(NSString *)key {
    return [tableViewDic objectForKey:key];
}

+ (NSString *)getCollectionIdentificationWithKey:(NSString *)key {
    return [collectionDic objectForKey:key];
}

@end
