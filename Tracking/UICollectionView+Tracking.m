//
//  UICollectionView+Tracking.m
//  ECourier
//
//  Created by Sarkizz on 15/12/24.
//  Copyright © 2015年 tracking. All rights reserved.
//

#import "UICollectionView+Tracking.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation UICollectionView (Tracking)

+ (void)load {
    //交换实现
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(setDelegate:)), class_getInstanceMethod(self, @selector(tracking_setDelegate:)));
}

- (void)tracking_setDelegate:(id<UICollectionViewDelegate>)delegate {
    
    [self tracking_setDelegate:delegate];
    
    Class class = [delegate class];
    if (class_addMethod([delegate class], NSSelectorFromString(@"tracking_didSelectItemAtIndexPath"), (IMP)tracking_didSelectItemAtIndexPath, "v@:@@")) {
    
        Method dis_originalMethod = class_getInstanceMethod(class, NSSelectorFromString(@"tracking_didSelectItemAtIndexPath"));
        Method dis_swizzledMethod = class_getInstanceMethod(class, @selector(collectionView:didSelectItemAtIndexPath:));
        //交换实现
        method_exchangeImplementations(dis_originalMethod, dis_swizzledMethod);
    }
}

void tracking_didSelectItemAtIndexPath(id self, SEL _cmd, id collectionView, id indexpath) {
    SEL selector = NSSelectorFromString(@"tracking_didSelectItemAtIndexPath");
    ((void(*)(id, SEL,id, id))objc_msgSend)(self, selector, collectionView, indexpath);
    
    //此处添加你想统计的打点事件
    NSLog(@"你现在正在点击的是%@页面的第%ld栏第%ld行",NSStringFromClass([self class]),((NSIndexPath *)indexpath).section,((NSIndexPath *)indexpath).row);
}

@end
