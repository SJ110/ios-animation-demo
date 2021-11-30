//
//  SwipeInteractiveTransition.h
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SwipeInteractiveTransition : UIPercentDrivenInteractiveTransition
/// 正在交互中
@property (nonatomic, assign) BOOL interacting;

- (void)wireToViewController:(UIViewController *)VC;
@end

NS_ASSUME_NONNULL_END
