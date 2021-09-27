//
//  ViewController9.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/15.
//

#import "ViewController9.h"

@interface ViewController9 (){
    CALayer *_layer;
}

@end

@implementation ViewController9

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 100, 100);
    _layer.position = CGPointMake(120, 200);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:_layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CABasicAnimation *ani1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    ani1.toValue = (id)[UIColor blueColor].CGColor;
    CABasicAnimation *ani2 = [CABasicAnimation animationWithKeyPath:@"position"];
    ani2.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 400)];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    CABasicAnimation *ani3 = [CABasicAnimation animationWithKeyPath:@"transform"];
    ani3.fromValue = @0;
    ani3.toValue = @M_PI;
    ani3.valueFunction =[CAValueFunction functionWithName:kCAValueFunctionRotateZ];
    ani3.beginTime = 2;
    group.duration = 3;
    group.animations = @[ani1,ani2,ani3];
    [_layer addAnimation:group forKey:@""];
}


@end
