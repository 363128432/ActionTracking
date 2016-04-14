//
//  UITableView+Tracking.m
//  baseDemo
//
//  Created by 付州  on 15/9/15.
//  Copyright (c) 2015年 FZ. All rights reserved.
//

#import "UITableView+Tracking.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation UITableView (Tracking)

+ (void)load
{
    //交换实现setDelegate,获取到代理人
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(setDelegate:)), class_getInstanceMethod(self, @selector(tracking_setDelegate:)));
}

- (void)tracking_setDelegate:(id<UITableViewDelegate>)delegate
{
    [self tracking_setDelegate:delegate];

    Class class = [delegate class];
    
    // 在代理人这先添加用于实现统计的方法，然后和交换原先的点击方法
    if (class_addMethod(class, NSSelectorFromString(@"tracking_didSelectRowAtIndexPath"), (IMP)tracking_didSelectRowAtIndexPath, "v@:@@")) {
        Method dis_originalMethod = class_getInstanceMethod(class, NSSelectorFromString(@"tracking_didSelectRowAtIndexPath"));
        Method dis_swizzledMethod = class_getInstanceMethod(class, @selector(tableView:didSelectRowAtIndexPath:));
        
        //交换实现
        method_exchangeImplementations(dis_originalMethod, dis_swizzledMethod);
    }
}

void tracking_didSelectRowAtIndexPath(id self, SEL _cmd, id tableView, id indexpath)
{
    SEL selector = NSSelectorFromString(@"tracking_didSelectRowAtIndexPath");
    ((void(*)(id, SEL,id, id))objc_msgSend)(self, selector, tableView, indexpath);
    
    //此处添加你想统计的打点事件
    NSLog(@"你现在正在点击的是%@页面的第%ld栏第%ld行",NSStringFromClass([self class]),((NSIndexPath *)indexpath).section,((NSIndexPath *)indexpath).row);
}

@end
