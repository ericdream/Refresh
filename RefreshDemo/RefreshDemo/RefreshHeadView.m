//
//  RefreshHeadView.m
//  YFOASystem
//
//  Created by apple on 17/05/2017.
//  Copyright © 2017 wangshang. All rights reserved.
//

#import "RefreshHeadView.h"
#import "AnimationView.h"
@interface RefreshHeadView ()
@property(nonatomic,strong) AnimationView *animationView;
@end
@implementation RefreshHeadView
- (AnimationView *)animationView{
    if(_animationView == nil){
        _animationView = [[AnimationView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _animationView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 20);
        [self addSubview:_animationView];
    }
    return _animationView;
}
+ (instancetype)initRefreshWithBlock:(CallBackComplete)callBack{
    RefreshHeadView *header = [[RefreshHeadView alloc] init];
    header.callBack = callBack;
    return header;
}
- (void)prepareFrame{
    [super prepareFrame];
    self.y = -RefreshHeaderHeight;
    self.heigth = RefreshHeaderHeight;
    self.width = [UIScreen mainScreen].bounds.size.width;
     self.titleLb.hidden = YES;
}
- (void)observerGestureStateChanged:(NSDictionary *)changed{
    [super observerGestureStateChanged:changed];
    if(scrollView.panGestureRecognizer.state == UIGestureRecognizerStateEnded){
        
    };
}
- (void)observerContentInsetChanged:(NSDictionary *)changed{
    [super observerContentInsetChanged:changed];
    
}
- (void)observerContentOffsetChanged:(NSDictionary *)changed{
    [super observerContentOffsetChanged:changed];
    if(self.refreshState == RefreshStateRefreshing){
        scrollView.contentInset= UIEdgeInsetsMake(self.heigth, 0, 0, 0);
        return;
    }
    CGFloat offset_y = -scrollView.contentOffset.y;
    //    CGFloat offsetPercent = offset_y/self.heigth;
    if(scrollView.isDragging){
        if(offset_y < self.heigth){
            self.refreshState = RefreshStatePulling;
        }else{
            self.refreshState = RefreshStateWillRefresh;
            
        }
    }else{
        if(self.refreshState == RefreshStateWillRefresh){
            self.refreshState = RefreshStateRefreshing;
        }
    }
    
}
- (void)startRefresh{
    if(self.callBack)self.callBack();
}
- (void)setRefreshState:(RefreshState)refreshState{
    [super setRefreshState:refreshState];
    self.animationView.hidden = YES;
    if(refreshState == RefreshStatePulling){
        [UIView animateWithDuration:0.2 animations:^{
           self.titleLb.text = @"准备刷新";
            self.titleLb.hidden = NO;
        }];
    
    }else if (refreshState == RefreshStateWillRefresh){
   
        [UIView animateWithDuration:0.2 animations:^{
             self.titleLb.text = @"松开刷新";
            self.titleLb.hidden = NO;
        }];
    }else if (refreshState == RefreshStateRefreshing){
         [ self startRefresh];
        [UIView animateWithDuration:0.2 animations:^{
            scrollView.contentInset= UIEdgeInsetsMake(self.heigth, 0, 0, 0);
            [scrollView setContentOffset:CGPointMake(0, -RefreshHeaderHeight)];
           self.titleLb.text = @"刷新中";
            self.titleLb.hidden = YES;
            self.animationView.hidden = NO;
        }];
    
    }else{
        self.titleLb.hidden = YES;
        [UIView animateWithDuration:0.4 animations:^{
            scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        }];
    }
}
- (void)beginRefresh{
    self.refreshState = RefreshStateRefreshing;
}
- (UILabel *)titleLb{
    if(_titleLb == nil){
        _titleLb = [UILabel new];
        _titleLb.textColor = [UIColor colorWithWhite:0.6 alpha:1];
        _titleLb.frame = CGRectMake(0, 0, 100, self.heigth);
        _titleLb.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 20);
        [self addSubview:_titleLb];
    }
    return _titleLb;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
