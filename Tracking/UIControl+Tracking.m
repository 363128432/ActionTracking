//
//  UIControl+Tracking.m
//  demo
//
//  Created by 付州  on 15/8/18.
//  Copyright (c) 2015年 AAAA付州 . All rights reserved.
//

/**
 * 用来统计点击事件，，
 */

#import "UIControl+Tracking.h"
#import <objc/runtime.h>
#import "TarckingDictionary.h"

@implementation UIControl (Tracking)


+ (void)load
{
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(sendAction:to:forEvent:)), class_getInstanceMethod(self, @selector(tracking_sendAction:to:forEvent:)));
}

- (void)tracking_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [self tracking_sendAction:action to:target forEvent:event];
    
    //此处添加你想统计的打点事件
    NSLog(@"你现在点击的是%@",[TarckingDictionary getControlIdentificationWithKey:[NSString stringWithFormat:@"%@_%@_%ld",NSStringFromClass([target class]),NSStringFromSelector(action),self.tag]]);
}

@end
