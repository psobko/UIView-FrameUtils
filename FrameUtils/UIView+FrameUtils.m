//
// Created by Peter Sobkowski on 3/7/2014.
// Copyright (c) 2014 psobko. All rights reserved.
//

#import "UIView+FrameUtils.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (FrameUtils)

#pragma mark - X/Y

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)x
{
    [self setX:x andY:self.frame.origin.y];
}

- (CGFloat)midX
{
    return CGRectGetMidX(self.frame);
}

-(void)setMidX:(CGFloat)midX
{
    self.center = CGPointMake(midX, self.midY);
}

- (CGFloat)maxX
{
    return CGRectGetMaxX(self.frame);
}

-(void)setMaxX:(CGFloat)maxX
{
    [self setX:maxX - self.width
          andY:self.frame.origin.y];
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)y
{
    [self setX:self.frame.origin.x andY:y];
}

- (CGFloat)midY
{
    return CGRectGetMidY(self.frame);
}

-(void)setMidY:(CGFloat)midY
{
    self.center = CGPointMake(self.midX, midY);
}
- (CGFloat)maxY
{
    return CGRectGetMaxY(self.frame);
}

-(void)setMaxY:(CGFloat)maxY
{
    [self setX:self.frame.origin.x
          andY:maxY - self.height];
}

- (void)setX:(CGFloat)x andY:(CGFloat)y
{
    CGRect f = self.frame;
    self.frame = CGRectMake(x, y, f.size.width, f.size.height);
}

#pragma mark - Width/Height

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
    
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)width andHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    frame.size.width = width;
    self.frame = frame;
}

#pragma mark - Offset

- (void)offsetX:(CGFloat)x
{
    [self offsetX:x andY:0];
    
}

- (void)offsetY:(CGFloat)y
{
    [self offsetX:0 andY:y];
    
}

- (void)offsetX:(CGFloat)x andY:(CGFloat)y
{
    [self setX:self.frame.origin.x + x
          andY:self.frame.origin.y + y];
}

#pragma mark - Scaling

- (void)scaleSizeByFactor:(CGFloat)factor
{
    [self setWidth:self.width*factor andHeight:self.height*factor];
}

#pragma mark - Centering

-(void)centerXWithRect:(CGRect)rect
{
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMidX(rect) - self.width/2;
    self.frame = frame;
}
-(void)centerYWithRect:(CGRect)rect
{
    CGRect frame = self.frame;
    frame.origin.y = CGRectGetMidY(rect) - self.height/2;
    self.frame = frame;
}

-(void)centerWithRect:(CGRect)rect
{
    CGRect frame = self.frame;
    frame.origin.x = CGRectGetMidX(rect) - self.width/2;
    frame.origin.y = CGRectGetMidY(rect) - self.height/2;
    self.frame = frame;
}

- (void)centerXInParent
{
    [self centerXInRect:self.superview.frame];
}

- (void)centerYInParent
{
    [self centerYInRect:self.superview.frame];
}

- (void)centerInParent
{
    [self centerInRect:self.superview.frame];
}

- (void)centerXWithView:(UIView *)view
{
    CGPoint c = [self.superview convertPoint:view.center fromView:view.superview];
    c.y = self.center.y;
    self.center = c;
}

- (void)centerYWithView:(UIView *)view
{
    CGPoint c = [self.superview convertPoint:view.center fromView:view.superview];
    c.x = self.center.x;
    self.center = c;
}

- (void)centerWithView:(UIView *)view
{
    CGPoint c = [self.superview convertPoint:view.center fromView:view.superview];
    self.center = c;
}

- (void)centerInRect:(CGRect)rect
{
    CGFloat centerX = CGRectGetMidX(rect) - rect.origin.x;
    CGFloat centerY = CGRectGetMidY(rect) - rect.origin.y;
    self.center = CGPointMake(centerX, centerY);
}

- (void)centerXInRect:(CGRect)rect
{
    CGFloat centerX = CGRectGetMidX(rect);
    CGRect f = self.frame;
    f.origin.x = (centerX - (f.size.width / 2)) - rect.origin.x;
    self.frame = f;
}

- (void)centerYInRect:(CGRect)rect
{
    CGFloat centerY = CGRectGetMidY(rect);
    CGRect f = self.frame;
    f.origin.y = (centerY - (f.size.height / 2)) - rect.origin.y;
    self.frame = f;
}

-(void)centerInScreen
{
    [self centerInRect:[[UIScreen mainScreen] bounds]];
}

@end