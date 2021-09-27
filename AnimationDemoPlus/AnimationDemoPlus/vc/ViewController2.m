//
//  ViewController2.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/12.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 40, 40)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    NSTimeInterval times = 3;
//    [UIView animateWithDuration:times animations:^{
//        view.frame = CGRectMake(200, 200, 80, 80);
//        view.backgroundColor = [UIColor redColor];
//    }];
//    [UIView animateWithDuration:times animations:^{
//        view.frame = CGRectMake(200, 200, 80, 80);
//        view.backgroundColor = [UIColor redColor];
//    } completion:^(BOOL finished) {
//
//    }];
//    [UIView animateWithDuration:times delay:2 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
//        view.frame = CGRectMake(200, 200, 80, 80);
//        view.backgroundColor = [UIColor redColor];
//    } completion:^(BOOL finished) {
//
//    }];
    
    [UIView animateWithDuration:times delay:2 usingSpringWithDamping:0.5 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseIn animations:^{
        view.frame = CGRectMake(200, 200, 80, 80);
        view.backgroundColor = [UIColor redColor];
    } completion:^(BOOL finished) {
        
    }];
}


@end
