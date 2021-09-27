//
//  ViewController4.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/13.
//

#import "ViewController4.h"

@interface ViewController4 (){
    UIView *view;
    UIView *view2;
}

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
    view.backgroundColor = [UIColor redColor];
    view2 = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 80, 80)];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /// 视图自身变化进行转场
    [UIView transitionWithView:view duration:3 options:UIViewAnimationOptionTransitionFlipFromBottom | UIViewAnimationOptionAllowAnimatedContent animations:^{
        self->view.backgroundColor = [UIColor blueColor];
        self->view.frame = CGRectMake(200, 200, 80, 80);
    } completion:^(BOOL finished) {

    }];
    /// 切换视图转场
//    [UIView transitionFromView:view toView:view2 duration:3 options:UIViewAnimationOptionTransitionFlipFromBottom |UIViewAnimationOptionAllowAnimatedContent  completion:^(BOOL finished) {
//
//    }];
}

@end
