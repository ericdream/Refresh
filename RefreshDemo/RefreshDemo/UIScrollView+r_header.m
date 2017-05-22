//
//  UIScrollView+Test.m
//  YFOASystem
//
//  Created by apple on 17/05/2017.
//  Copyright © 2017 wangshang. All rights reserved.
//

#import "UIScrollView+r_header.h"
#import <objc/runtime.h>
#import "RefreshHeadView.h"
@implementation UIScrollView (r_header)
static const char MJRefreshHeaderKey = '\0';
- (void)setHeadView:(RefreshHeadView *)headView{
    if (headView!=self.headView) {
        [self.headView removeFromSuperview];
    [self insertSubview:headView atIndex:0];
        objc_setAssociatedObject(self, &MJRefreshHeaderKey, headView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
- (RefreshHeadView *)headView{
    return objc_getAssociatedObject(self, &MJRefreshHeaderKey);
}
@end
