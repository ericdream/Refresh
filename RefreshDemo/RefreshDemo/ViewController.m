//
//  ViewController.m
//  RefreshDemo
//
//  Created by apple on 17/05/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import "ViewController.h"
#import "AnimationView.h"

#import "RefreshHeadView.h"
@interface ViewController ()
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    AnimationView *view = [[AnimationView alloc] initWithFrame:CGRectMake(0, 100, 150, 150)];
    view.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:view];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    __weak UITableView *tableView1 = _tableView;
    [self.view addSubview:_tableView];
    __weak typeof(self) weakSelf = self;
    RefreshHeadView *header = [RefreshHeadView initRefreshWithBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [tableView1.headView endHeaderRefresh];
        });
    }];
    tableView1.headView = header;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
