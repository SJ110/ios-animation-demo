//
//  ViewController6.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/15.
//

#import "ViewController6.h"

@interface ViewController6 (){
    CALayer *_layer;
}

@end

@implementation ViewController6

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    _layer = [CALayer layer];
    _layer.bounds = CGRectMake(0, 0, 100, 100);
    _layer.position = CGPointMake(160, 200);
    _layer.backgroundColor = [UIColor yellowColor].CGColor;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /// gradient
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anim.fromValue = (id)[UIColor redColor].CGColor;
    anim.toValue = (id)[UIColor blueColor].CGColor;
    anim.duration = 2;
    [_layer addAnimation:anim forKey:@""];
    /// rotate
    CABasicAnimation *anima2 = [CABasicAnimation animationWithKeyPath:@"transform"];
    anima2.fromValue = @0;
    anima2.toValue = @200;
    anima2.duration = 2;
    anima2.valueFunction =[CAValueFunction functionWithName:kCAValueFunctionTranslateX];
    [_layer addAnimation:anima2 forKey:@"2"];
    [self.view.layer addSublayer:_layer];
}


@end
