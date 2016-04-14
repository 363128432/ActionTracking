//
//  UIViewController+Tracking.m
//  ECourier
//
//  Created by 付州  on 15/8/4.
//  Copyright (c) 2015年 CIMC. All rights reserved.
//

#import "UIViewController+Tracking.h"
#import <objc/runtime.h>
#import "TarckingDictionary.h"

@implementation UIViewController (Tracking)

+ (void)load {
    // 交换实现viewWillAppear
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewWillAppear:)),class_getInstanceMethod(self, @selector(tracking_viewWillAppear:)));
    
    //交换实现viewWillDisappear
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewWillDisappear:)), class_getInstanceMethod(self, @selector(tracking_viewWillDisappear:)));

}

#pragma mark - Method Swizzling

- (void)tracking_viewWillAppear:(BOOL)animated {
    [self tracking_viewWillAppear:animated];
    
    //此处添加你想统计的打点事件
    NSLog(@"你现在进入%@",[TarckingDictionary getViewControllerIdentificationWithKey:NSStringFromClass([self class])]);
}

- (void)tracking_viewWillDisappear:(BOOL)animated {
    [self tracking_viewWillDisappear:animated];
    
    //此处添加你想统计的打点事件
     NSLog(@"你现在退出%@",[TarckingDictionary getViewControllerIdentificationWithKey:NSStringFromClass([self class])]);
}

@end
