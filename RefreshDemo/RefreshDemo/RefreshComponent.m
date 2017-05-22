//
//  RefreshComponent.m
//  RefreshDemo
//
//  Created by apple on 21/05/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import "RefreshComponent.h"
CGFloat const RefreshHeaderHeight = 44.0f;
CGFloat const RefreshFooterHeight = 44.0f;
NSString *const kcontentOffset = @"contentOffset";
NSString *const kcontentInset = @"contentInset";
NSString *const kgesture = @"state";
@implementation RefreshComponent{
    UIPanGestureRecognizer *pan;
}
- (void)willMoveToSuperview:(UIView *)newSuperview{
     [super willMoveToSuperview:newSuperview];
    [self removeAllOberver];
    
    if([newSuperview  isKindOfClass:[UIScrollView class]]){
        
        scrollView = (UIScrollView *)newSuperview;
        pan = scrollView.panGestureRecognizer;
        [self addAllObserver];
        [self prepareFrame];
    }
}
- (void)willRemoveSubview:(UIView *)subview{

}
- (void)removeAllOberver{
    [self.superview removeObserver:self forKeyPath:kcontentOffset];
    [self.superview removeObserver:self forKeyPath:kcontentInset];
    [pan removeObserver:self forKeyPath:kgesture];
    pan = nil;
}
- (void)addAllObserver{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [scrollView addObserver:self forKeyPath:kcontentOffset options:options context:nil];
    [scrollView addObserver:self forKeyPath:kcontentInset options:options context:nil];
    [pan addObserver:self forKeyPath:kgesture options:options context:nil];
}
-  (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:kcontentOffset]){
        [self observerContentOffsetChanged:change];
    }
    if([keyPath isEqualToString:kcontentInset]){
        [self observerContentInsetChanged:change];
    }
    
    if([keyPath isEqualToString:kgesture]){
        [self observerGestureStateChanged:change];
    }
}
- (void)observerContentOffsetChanged:(NSDictionary *)changed{
    
}
- (void)observerContentInsetChanged:(NSDictionary *)changed{}
- (void)observerGestureStateChanged:(NSDictionary *)changed{}
/**
 设置 frame
 */
- (void)prepareFrame{
    
}
- (void)endFooterRefresh{
    self.refreshState = RefreshStateFree;
    [UIView animateWithDuration:0.4 animations:^{
  scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
  
    
}
- (void)endHeaderRefresh{
    self.refreshState = RefreshStateFree;
    
    [UIView animateWithDuration:0.4 animations:^{
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }];
    
}
- (void)dealloc{
    [self removeAllOberver];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
