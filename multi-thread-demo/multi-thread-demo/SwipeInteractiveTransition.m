//
//  SwipeInteractiveTransition.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/26.
//

#import "SwipeInteractiveTransition.h"

@interface SwipeInteractiveTransition ()

@property (nonatomic, assign) BOOL shoudComplete;

@property (nonatomic, strong) UIViewController *presentingVc;
@end

@implementation SwipeInteractiveTransition

- (void)wireToViewController:(UIViewController *)VC {
    self.presentingVc = VC;
    [self prepareGestrueInView:VC.view];
}

- (void)prepareGestrueInView:(UIView *)view {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDismiss:)];
    [view addGestureRecognizer:pan];
}

- (CGFloat)completionSpeed {
    return 1 - self.percentComplete;
}

- (void)panDismiss:(UIPanGestureRecognizer *)gestrue {
    CGPoint translation = [gestrue translationInView:gestrue.view.superview];
    switch (gestrue.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.interacting = YES;
            [self.presentingVc dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            NSLog(@"---%@",NSStringFromCGPoint(translation));
            CGFloat fraction = translation.y / 400.0;
            /// 限制在0-1
            fraction = fminf(fmaxf(fraction, 0.0), 1);
            self.shoudComplete = (fraction > 0.5);
            [self updateInteractiveTransition:fraction];
        }
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            self.interacting = NO;
            if (!self.shoudComplete || gestrue.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            } else {
                [self finishInteractiveTransition];
            }
        }
            break;
        default:
            break;
    }
}


@end
