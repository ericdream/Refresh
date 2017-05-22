//
//  RefreshComponent.h
//  RefreshDemo
//
//  Created by apple on 21/05/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
#import "UIScrollView+r_header.h"
UIKIT_EXTERN const CGFloat RefreshHeaderHeight;
UIKIT_EXTERN const CGFloat RefreshFooterHeight;

typedef NS_ENUM(NSInteger,RefreshState) {
    RefreshStateFree = 1,
    RefreshStatePulling,
    RefreshStateRefreshing,
    RefreshStateWillRefresh,
    RefreshStateNoMoreData
};

@interface RefreshComponent : UIView{
__weak UIScrollView *scrollView;
}
@property(nonatomic,assign)RefreshState refreshState;
- (void)prepareFrame;
- (void)observerContentOffsetChanged:(NSDictionary *)changed;

- (void)observerContentInsetChanged:(NSDictionary *)changed;

- (void)observerGestureStateChanged:(NSDictionary *)changed;
- (void)endHeaderRefresh;
- (void)endFooterRefresh;
@end
