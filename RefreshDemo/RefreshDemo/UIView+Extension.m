//
//  UIView+Extension.m
//  RefreshDemo
//
//  Created by apple on 21/05/2017.
//  Copyright © 2017 Eric. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
- (void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}
- (CGFloat)x{
    return self.frame.origin.x;
}
- (void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}
- (CGFloat)y{
    return self.frame.origin.y;
}
- (void)setHeigth:(CGFloat)heigth{
    CGRect rect = self.frame;
    rect.size.height = heigth;
    self.frame = rect;
}
- (CGFloat)heigth{
    return self.frame.size.height;
}
- (void)setWidth:(CGFloat)width{
    CGRect rect = self.frame;
    rect.size.width= width;
    self.frame = rect;
}
- (CGFloat)width{
    return self.frame.size.width;
}
- (void)setSize:(CGSize)size{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}
- (CGSize)size{
    return self.frame.size;
}
- (void)setOrigin:(CGPoint)origin{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}
- (CGPoint)origin{
    return self.frame.origin;
}

@end
