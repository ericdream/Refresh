//
//  RefreshHeadView.h
//  YFOASystem
//
//  Created by apple on 17/05/2017.
//  Copyright © 2017 wangshang. All rights reserved.
//

#import "RefreshComponent.h"
typedef void (^CallBackComplete)();
@interface RefreshHeadView : RefreshComponent
@property(nonatomic,copy)CallBackComplete callBack;
+ (instancetype)initRefreshWithBlock:(CallBackComplete)callBack;
@property(nonatomic,strong)UILabel *titleLb;
- (void)beginRefresh;
@end
