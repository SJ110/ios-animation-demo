//
//  ViewControllerDismisstransition.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/27.
//

#import "ViewControllerDismisstransition.h"

@implementation ViewControllerDismisstransition

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    /// 此时拿到的toVC 是navicontroller
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVc];
    CGRect finalFrame = CGRectOffset(initFrame, 0, [UIScreen mainScreen].bounds.size.height);
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    [containerView sendSubviewToBack:toVc.view];
        
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        fromVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        /// 设置是否视图是否移除
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}
@end
