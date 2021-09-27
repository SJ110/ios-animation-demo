//
//  ViewController7.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/15.
//

#import "ViewController7.h"

@interface ViewController7 (){
    CALayer *_layer;
}

@end

@implementation ViewController7

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 100, 100);
    _layer.position = CGPointMake(160, 200);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAKeyframeAnimation *ani = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ani.values = @[[NSValue valueWithCGPoint:CGPointMake(100, 200)],[NSValue valueWithCGPoint:CGPointMake(120, 300)],[NSValue valueWithCGPoint:CGPointMake(140, 400)],[NSValue valueWithCGPoint:CGPointMake(160, 800)]];
    ///设置每段动画的时间占比，第一个位置到第二个位置占比0.5,第二个位置到第三个位置占比0.3
    ani.keyTimes = @[@0,@0.5,@0.8,@1];
    ani.duration = 3;
    [_layer addAnimation:ani forKey:@""];
    [self.view.layer addSublayer:_layer];
}

@end
