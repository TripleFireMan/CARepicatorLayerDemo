//
//  CYEmitterLayer.m
//  CYEmitterDemo
//
//  Created by 成焱 on 2017/5/6.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "CYEmitterLayer.h"
#import <UIKit/UIKit.h>

@implementation CYEmitterLayer
- (id)init
{
    self = [super init];
    if (self) {
        self.count = 1;
        self.imageLayer = [CALayer layer];
        self.imageLayer.contents = (id)[UIImage imageNamed:@"brightBlob"].CGImage;
        self.instanceColor = [[UIColor whiteColor]CGColor];
        [self addSublayer:self.imageLayer];
    }
    return self;
}

- (void)start
{
    // 配置发射信息
    self.imageLayer.frame = self.bounds;
    self.imageLayer.opacity = 1.0f;
    self.instanceCount = self.count;
    self.instanceDelay = self.cycleTime / self.count;
    
    // 校准粒子与上个粒子之间的角度以及位置
    CATransform3D transform = CATransform3DMakeRotation(self.rotator, 0, 0, 1);
    self.instanceTransform = CATransform3DTranslate(transform, self.xAdjust, self.yAdjust, 0);
    
    // 校准发射源发射角度
    self.transform = CATransform3DMakeRotation(self.angle, 0, 0, 1);
    
    // 执行动画，实现发射效果
    [self animation];
}

- (void)animation
{
    CGPoint newPoint = CGPointMake(0, self.length);
    CABasicAnimation *basic = [CABasicAnimation animation];
    basic.keyPath = @"position";
    basic.toValue = [NSValue valueWithCGPoint:newPoint];
    basic.duration = self.cycleTime;
    basic.repeatCount = MAXFLOAT;
    [self.imageLayer addAnimation:basic forKey:@"position"];
}

- (void)stop
{
    self.imageLayer.opacity = 0;
    [self.imageLayer removeAllAnimations];
    self.instanceCount = 0;
}
@end
