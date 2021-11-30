//
//  ViewControllerAnimatedTransitioning.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/26.
//

#import "ViewControllerAnimatedTransitioning.h"

@implementation ViewControllerAnimatedTransitioning
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    /// 1、获取转换vc
    UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    /// 获取视图大小
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVc];
    CGFloat oriY = [UIScreen mainScreen].bounds.size.height;
    CGFloat oriX = [UIScreen mainScreen].bounds.size.width;
    switch (self.type) {
        case 0:
        {
            /// 动画视图初始位置
            toVc.view.frame = CGRectOffset(finalFrame, -oriX,-oriY);
        }
            break;
        case 1:
        {
            /// 动画视图初始位置
            toVc.view.frame = CGRectOffset(finalFrame, 0, oriY);
        }
            break;
        case 2:
        {
            return;
        }
            break;
        default:
            break;
    }
    /// 视图添加到containerView,不添加则展示不了
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVc.view];
    
    /// animation
    /// usingSpringWithDamping 0-1 值越小,则弹性阻尼效果越明显
    /// initialSpringVelocity 初始速度,值越大,动画效果越快
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        toVc.view.frame = finalFrame;
    } completion:^(BOOL finished) {
        /// 标记动画全部完成
        [transitionContext completeTransition:YES];
    }];
}


@end
