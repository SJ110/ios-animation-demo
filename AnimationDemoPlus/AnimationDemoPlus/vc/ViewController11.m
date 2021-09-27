//
//  ViewController11.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/26.
//

#import "ViewController11.h"

@interface ViewController11 ()
@property(nonatomic, strong) CAEmitterLayer *emitterLayer;

@end

@implementation ViewController11

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    _emitterLayer = [[CAEmitterLayer alloc] init];
    /// 粒子发射器在xy平面的位置
    _emitterLayer.emitterPosition = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height - 20);
    /// 粒子发射器的大小
    _emitterLayer.emitterSize = CGSizeMake(self.view.frame.size.width-100, 20);
    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.cornerRadius = 5;
    [self.view addSubview:view];
    UIImage *img = [self imageFromView:view];
    /// 火焰发射单元
    /// 粒子单元
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    /// 粒子的创建速率 默认1/s
    fire.birthRate = 1600;
    /// 粒子存活时间，默认1s
    fire.lifetime = 3.0;
    /// 粒子的生存时间容差
    fire.lifetimeRange = 1.5;
    fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
    fire.name = @"fire";
    fire.contents = (id)img.CGImage;
    /// 粒子速率
    fire.velocity = 160;
    /// 粒子速率容差
    fire.velocityRange = 80;
    /// 粒子在xy平面的发射角度
    fire.emissionLongitude = M_PI + M_PI_2;
    /// 粒子发射角度容差
    fire.emissionRange = M_PI_2;
    /// 粒子缩放速度
    fire.scaleSpeed = 0.3;
    /// 粒子旋转度
    fire.spin = 0.2;
    /// 烟雾
    CAEmitterCell *smoke = [CAEmitterCell emitterCell];
    smoke.birthRate = 800;
    smoke.lifetime = 4.0;
    smoke.lifetimeRange = 1.5;
    smoke.color = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.05].CGColor;
    smoke.name = @"smoke";
    smoke.contents = (id)img.CGImage;
    smoke.velocity = 160;
    smoke.velocityRange = 100;
    smoke.emissionLongitude = M_PI+M_PI_2;
    smoke.emissionRange = M_PI_2;
    _emitterLayer.emitterCells = [NSArray arrayWithObjects:smoke,fire, nil];
    [self.view.layer addSublayer:_emitterLayer];
}

- (UIImage *)imageFromView:(UIView *)view {
    CGSize size = view.frame.size;
    UIGraphicsBeginImageContext(size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
