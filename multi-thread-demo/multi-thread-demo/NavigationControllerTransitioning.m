//
//  NavigationControllerTransitioning.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/29.
//

#import "NavigationControllerTransitioning.h"

@implementation NavigationControllerTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    /// 此方法在push和pop时都会执行
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *fromView = fromVc.view;
//    CGRect screenFrame = fromView.frame;
    UIView *toView = toVc.view;
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView];
    if (self.type == 4) {
        [containerView bringSubviewToFront:fromView];
    //    [containerView bringSubviewToFront:toView];
    //    toView.transform = CGAffineTransformMakeScale(0.2, 0.2);
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            fromView.alpha = 0;
            fromView.transform = CGAffineTransformMakeScale(0.2, 0.2);
    //        toView.transform = CGAffineTransformMakeScale(1, 1);
            toView.alpha = 1;
        } completion:^(BOOL finished) {
            fromView.transform = CGAffineTransformMakeScale(1, 1);
            [transitionContext completeTransition:YES];
        }];
    } else if (self.type == 5) {

        toView.transform = CGAffineTransformMakeScale(0.2, 0.2);
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            toView.transform =  CGAffineTransformMakeScale(1, 1);
//            toView.frame = screenFrame;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
        
    }
    
}
@end
