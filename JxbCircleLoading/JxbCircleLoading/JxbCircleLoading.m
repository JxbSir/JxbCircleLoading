//
//  JxbCircleLoading.m
//  JxbCircleLoading
//
//  Created by Peter on 15/2/11.
//  Copyright (c) 2015年 Peter. All rights reserved.
//

#import "JxbCircleLoading.h"

#define lineColor [UIColor colorWithRed:33/255.0 green:116/255.0 blue:160/255.0 alpha:1]
#define dotWidth  20

@interface JxbCircleLoading()
{
    UIView*     vCircle;
    UIView*     vDot;
}
@end

@implementation JxbCircleLoading

- (id)init
{
    self = [super init];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self initCircle];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.layer.cornerRadius = frame.size.width / 2;
    
    [self initCircle];
}

- (void)initCircle
{
    if (!vCircle)
    {
        vCircle = [[UIView alloc] init];
        vCircle.layer.borderColor = [lineColor CGColor];
        vCircle.layer.borderWidth = 3;
        vCircle.layer.masksToBounds = YES;
        [self addSubview:vCircle];
    }
    [vCircle setFrame:CGRectMake(5, 5, self.bounds.size.width - 10, self.bounds.size.height - 10)];
    vCircle.layer.cornerRadius = (self.bounds.size.width - 10) / 2;
    
    if (!vDot)
    {
        vDot = [[UIView alloc] init];
        vDot.backgroundColor = [UIColor whiteColor];
        vDot.layer.anchorPoint = CGPointMake(0.5, 1.0);
        [self addSubview:vDot];
    }
    CGFloat w = self.bounds.size.width / 6;
    [vDot setFrame:CGRectMake((self.bounds.size.width - w) / 2, 0, w, self.bounds.size.height - self.bounds.size.height / 2)];
}

- (void)start
{
    if (![vDot.layer.animationKeys containsObject:@"rotationAnimation"])
    {
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
        rotationAnimation.duration = 2;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = HUGE_VALF;
        rotationAnimation.byValue = @(M_PI*2);
        [vDot.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
}

- (void)stop
{
    [vDot.layer removeAllAnimations];
}

@end
