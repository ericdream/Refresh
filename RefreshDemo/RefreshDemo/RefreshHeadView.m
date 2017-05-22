//
//  RefreshHeadView.m
//  YFOASystem
//
//  Created by apple on 17/05/2017.
//  Copyright © 2017 wangshang. All rights reserved.
//

#import "RefreshHeadView.h"

@implementation RefreshHeadView
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
    NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat offset_y = -scrollView.contentOffset.y;
    //    CGFloat offsetPercent = offset_y/self.heigth;
    if(scrollView.isDragging){
        if(offset_y < self.heigth){
            
        }else{
            [ self beginRefresh];
            scrollView.contentInset= UIEdgeInsetsMake(self.heigth, 0, 0, 0);
        }
    }else{
        
    }
    
}
- (void)beginRefresh{
    self.titleLb.text = @"刷新中";
    self.refreshState = RefreshStateRefreshing;
    if(self.callBack)self.callBack();
}
- (UILabel *)titleLb{
    if(_titleLb == nil){
        _titleLb = [UILabel new];
        _titleLb.textColor = [UIColor colorWithWhite:0.6 alpha:1];
        _titleLb.frame = CGRectMake(0, 0, 100, self.heigth);
        _titleLb.center = CGPointMake(100, 20);
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
