//
//  AnimationView.m
//  RefreshDemo
//
//  Created by apple on 17/05/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import "AnimationView.h"

@implementation AnimationView{
    NSTimer *timer;
    CAShapeLayer *shapLayer;
    CAShapeLayer *shapLayer1;
    CGFloat preogress;
    CGFloat preogress1;
    CADisplayLink *displayLink;
    CGFloat offset;
    
}
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        shapLayer = [[CAShapeLayer alloc] init];
//        shapLayer.frame = CGRectMake(0, 50, 200, 200);
        shapLayer.strokeColor=[UIColor clearColor].CGColor;
        shapLayer.fillColor=[UIColor colorWithRed:136/255.0f green:199/255.0f blue:190/255.0f alpha:1].CGColor;
//        shapLayer.lineCap = kCALineCapRound;
//        shapLayer.lineJoin = kCALineJoinRound;
//        shapLayer.strokeStart = 0.0;
        preogress1 =0.0;
        preogress = 0.2;
        [self.layer addSublayer:shapLayer];
        shapLayer1 = [CAShapeLayer layer];
        shapLayer1.strokeColor = [UIColor clearColor].CGColor;
         shapLayer1.fillColor=[UIColor colorWithRed:28/255.0 green:203/255.0 blue:174/255.0 alpha:1].CGColor;
//        shapLayer1.strokeColor = WaveColor1.CGColor;
        [self.layer addSublayer:shapLayer1];
        offset= 00;
//       timer = [NSTimer scheduledTimerWithTimeInterval:0.05 repeats:YES block:^(NSTimer * _Nonnull timer) {
//           if(preogress >= 1) preogress=0;
//           if(preogress1 >= 1) preogress1=0;
//           preogress += 0.02;
//           preogress1 += 0.02;
//           
//           shapLayer.strokeStart = preogress1;
//           shapLayer.strokeEnd = preogress;
//       }];
        displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(progressAction)];
        [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        self.layer.cornerRadius = self.bounds.size.width/2.0f;
        self.layer.masksToBounds = true;
        [self startAnimation];
    }
    return self;
}
- (void)stopAnimation{
    [displayLink setPaused:YES];
}
- (void)startAnimation{
    [displayLink setPaused:NO];
}
- (void)progressAction{
    if(preogress>=1){
        preogress = 0.0;
    }
    preogress += 0.002;
    offset +=M_PI/self.bounds.size.width*2;
    [self setNeedsDisplay];
    //   shapLayer.strokeEnd = preogress;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
//    CGPoint points[50];
//    for (int i=0; i<50; i++) {
//        CGFloat x = 50+i*20;
//        CGFloat y = 100*sin(x+100)+200;
//        NSLog(@"(%f,%f)",x,y);
//        points[i] = CGPointMake(x, y);
//    }
//   
//    CGAffineTransform transform =  CGAffineTransformMakeTranslation(0, 100);
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddLines(path, &transform, points, 50);
//    shapLayer.lineWidth = 10;
//     shapLayer.path = path;
//    CGPathRelease(path);
//    CGMutablePathRef path = CGPathCreateMutable();
//     CGFloat width =  [UIScreen mainScreen].bounds.size.width;
//    CGContextRef contextRf = UIGraphicsGetCurrentContext();
////    CGContextAddArc(contextRf, width/2, 200, 100, 0, 2*M_PI, YES);
////    CGContextMoveToPoint(contextRf, 0, <#CGFloat y#>)
//    CGFloat ebdAngel = preogress*2*M_PI;
//    CGPathAddArc(path, nil, 0, 200, 100, 0, ebdAngel, NO);
//    CGPathAddLineToPoint(path, nil, 0, 200);
//    shapLayer.lineWidth = 3;
//    shapLayer.path = path;
//    [[UIColor redColor] setStroke];
//    CGPathRelease(path);
    CGFloat height = self.bounds.size.height;
    CGFloat offset_y = (1-0.5)*self.bounds.size.height;
    CGFloat waterWave_w =  self.bounds.size.width;
    CGMutablePathRef pathRf1 = CGPathCreateMutable();
    CGMutablePathRef pathRf2 = CGPathCreateMutable();
    CGPathMoveToPoint(pathRf1, nil, 0, offset_y);
    CGPathMoveToPoint(pathRf2, nil, 0, offset_y);
    for (float x = 0.0; x<waterWave_w; x++) {
        CGFloat y = 5*sin(M_PI/self.bounds.size.width*x+offset)+offset_y;
        CGPathAddLineToPoint(pathRf1, nil, x, y);
    }
    for (float x = 0.0; x<waterWave_w; x++) {
        CGFloat y = 5*cos(M_PI/self.bounds.size.width*x+offset)+offset_y;
        CGPathAddLineToPoint(pathRf2, nil, x, y);
    }
    CGPathAddLineToPoint(pathRf1, nil, waterWave_w, self.bounds.size.height);
    CGPathAddLineToPoint(pathRf1, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(pathRf1);
    CGPathAddLineToPoint(pathRf2, nil, waterWave_w, self.bounds.size.height);
    CGPathAddLineToPoint(pathRf2, nil, 0, self.bounds.size.height);
    CGPathCloseSubpath(pathRf2);
    shapLayer.path = pathRf1;
    shapLayer1.path = pathRf2;
    CGPathRelease(pathRf1);
    CGPathRelease(pathRf2);
}

@end
