//
//  TarckingDictionary.h
//  Tracking
//
//  Created by 付州  on 16/4/14.
//  Copyright © 2016年 LJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TarckingDictionary : NSObject

// 获取按钮标识
+ (NSString *)getControlIdentificationWithKey:(NSString *)key;

+ (NSString *)getViewControllerIdentificationWithKey:(NSString *)key;

+ (NSString *)getTableViewIdentificationWithKey:(NSString *)key;

+ (NSString *)getCollectionIdentificationWithKey:(NSString *)key;

@end
