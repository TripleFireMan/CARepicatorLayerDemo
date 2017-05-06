//
//  CYEmitterLayer.h
//  CYEmitterDemo
//
//  Created by 成焱 on 2017/5/6.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//  根据CAReplicatorLayer制定出一个粒子发射器。资源学习代码https://pragprog.com/book/cdirec/ios-recipes#links

#import <QuartzCore/QuartzCore.h>

@interface CYEmitterLayer : CAReplicatorLayer{}

@property (nonatomic, strong) CALayer *imageLayer;  //作为原始层，供CAReplicatorLayer 复制
@property (nonatomic, assign) CGFloat rotator;      //旋转因子，实现旋转功能
@property (nonatomic, assign) CGFloat length;       //发射长度
@property (nonatomic, assign) CGFloat count;        //一次发射的个数
@property (nonatomic, assign) CGFloat angle;        //发射角度
@property (nonatomic, assign) CGFloat cycleTime;    //循环时间
@property (nonatomic, assign) CGFloat xAdjust;      //x轴调整
@property (nonatomic, assign) CGFloat yAdjust;      //y轴调整

- (void)start;

- (void)stop;
@end
