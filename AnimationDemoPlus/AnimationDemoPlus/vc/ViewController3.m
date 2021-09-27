//
//  ViewController3.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/13.
//

#import "ViewController3.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [UIView new];
    view.frame = CGRectMake(100, 100, 80, 80);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [UIView beginAnimations:@"test" context:nil];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(start)];
    [UIView setAnimationDidStopSelector:@selector(stop)];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelay:1];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationRepeatCount:3];
    
    view.backgroundColor = [UIColor blueColor];
    view.frame = CGRectMake(200, 200, 80, 80);
    [UIView commitAnimations];
}

@end
