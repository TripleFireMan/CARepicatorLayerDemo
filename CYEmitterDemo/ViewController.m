//
//  ViewController.m
//  CYEmitterDemo
//
//  Created by 成焱 on 2017/5/6.
//  Copyright © 2017年 cheng.yan. All rights reserved.
//

#import "ViewController.h"
#import "CYEmitterLayer.h"
#import <CoreGraphics/CGColor.h>
static float screen_width(){
    float screen_w = [UIScreen mainScreen].bounds.size.width;
    return screen_w;
}

static float screen_height(){
    float screen_h = [UIScreen mainScreen].bounds.size.height;
    return screen_h;
}

static const float w_16 = 16.f;
static const float h_16 = 16.f;

@interface ViewController ()

@property (nonatomic, strong) CYEmitterLayer *emitter1;
@property (nonatomic, strong) CYEmitterLayer *emitter2;
@property (nonatomic, strong) CYEmitterLayer *emitter3;
@property (nonatomic, strong) CYEmitterLayer *emitter4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
//    CAReplicatorLayer *replicatorLayer = [self ReplicatorLayer];
//    replicatorLayer.frame = CGRectMake(10, 100, 50, 50);
//    [self.view.layer addSublayer:replicatorLayer];
    

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self performSelector:@selector(startEmitter:) withObject:self.emitter1 afterDelay:2];
    
    [self performSelector:@selector(startEmitter:) withObject:self.emitter2 afterDelay:5.f];
    
    
//    [self.view.layer addSublayer:[self rotateReplicatorLayer]];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startEmitter:(CYEmitterLayer *)emitter
{
    [emitter start];
    [self performSelector:@selector(stopEmitter:) withObject:emitter afterDelay:100];
}

- (void)stopEmitter:(CYEmitterLayer *)emitter
{
    [emitter stop];
    [self performSelector:@selector(startEmitter:) withObject:emitter afterDelay:3.0f];
}

- (CYEmitterLayer *)emitter1
{
    if (_emitter1) {
        return _emitter1;
    }
    
    _emitter1 = [CYEmitterLayer layer];
    
    _emitter1.frame = CGRectMake(screen_width() / 2, screen_height() / 2, w_16, h_16);
    _emitter1.length = screen_width() / 2;//发射长度为屏幕宽度
    _emitter1.count = 100;// 发射个数为100个
    _emitter1.cycleTime = 2.f;//一次发射持续时间 ，此时间用来计算间隔 = cycleTime / count
    _emitter1.rotator = -M_PI * 4 / 50;//旋转角度，下一个与上一个粒子之间的角度，正数为顺时间，负数为逆时针
    _emitter1.instanceRedOffset = -0.1/_emitter1.count;
    _emitter1.instanceGreenOffset = -0.2/_emitter1.count;
    _emitter1.instanceBlueOffset = -0.1/_emitter1.count;
    _emitter1.instanceColor = [[UIColor cyanColor]CGColor];
    [self.view.layer addSublayer:_emitter1];
    return _emitter1;
}

- (CYEmitterLayer *)emitter2
{
    if (_emitter2) {
        return _emitter2;
    }
    
    _emitter2 = [CYEmitterLayer layer];
    _emitter2.frame = CGRectMake(screen_width()/2, screen_height()/2, w_16, w_16);
    _emitter2.length = screen_width();
    _emitter2.count = 10;
    _emitter2.angle = -M_PI * 225.f / 180.f;
    _emitter2.cycleTime = 1.0f;
    [self.view.layer addSublayer:_emitter2];
    return _emitter2;
}

- (CAReplicatorLayer *)xReplicatorLayer
{
    // 创建原始图层，白色的大小 50，50
    CALayer *redLayer = [CALayer layer];
    redLayer.backgroundColor = [[UIColor whiteColor]CGColor];
    redLayer.frame = CGRectMake(0, 0, 50, 50);
    
    // 创建复制图层，并设置复制5个，复制转换为按横坐标偏移60，颜色为从白变为红
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = 5;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(60, 0, 0);
    CGFloat step = - 1 / 5.f;
    replicatorLayer.instanceGreenOffset = step;
    replicatorLayer.instanceBlueOffset = step;
    [replicatorLayer addSublayer:redLayer];
    
    return replicatorLayer;
}

- (CAReplicatorLayer *)ReplicatorLayer
{
    // 获取经过X轴变换的layer
    CAReplicatorLayer *redLayer = [self xReplicatorLayer];
    
    // 做纵坐标变换，复制6次，变换方式为向上偏移60，颜色从红变灰
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.instanceCount = 6;
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(0, 60, 0);
    CGFloat step = -1 / 6.f;
    replicatorLayer.instanceRedOffset = step;
    [replicatorLayer addSublayer:redLayer];
    
    return replicatorLayer;
}

- (CAReplicatorLayer *)rotateReplicatorLayer
{
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.frame = CGRectMake(screen_width() / 2, screen_height() / 2, w_16, h_16);
    CALayer *content = [CALayer layer];
    content.opacity = 1;
    content.frame = layer.bounds;
    content.contents = (id)[[UIImage imageNamed:@"brightBlob.png"]CGImage];
    
    layer.instanceCount = 36;
    layer.instanceColor = [[UIColor redColor]CGColor];
    CATransform3D transform = CATransform3DMakeTranslation(16, 0, 0);
    layer.instanceTransform = CATransform3DRotate(transform, -M_PI * 10 / 180, 0, 0, 1);
    [layer addSublayer:content];
    
    return layer;
}



@end
