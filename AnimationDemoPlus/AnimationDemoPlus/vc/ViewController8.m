//
//  ViewController8.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/15.
//

#import "ViewController8.h"

@interface ViewController8 ()

@end

@implementation ViewController8

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 300);
    layer.backgroundColor = [UIColor redColor].CGColor;
    CATransition *ani = [CATransition animation];
    ani.type = kCATransitionPush;
    ani.subtype = kCATransitionFromRight;
    ani.duration = 3;
    [layer addAnimation:ani forKey:@""];
    [self.view.layer addSublayer:layer];
}

@end
