//
//  ModalViewController.h
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ModalViewControllerDelegate <NSObject>
- (void)dismissModalViewController:(UIViewController *)vc;

@end

@interface ModalViewController : UIViewController
@property (nonatomic, weak) id<ModalViewControllerDelegate> delegate;
- (void)setDismissAnimate:(NSString *)animteString;
@end


NS_ASSUME_NONNULL_END
