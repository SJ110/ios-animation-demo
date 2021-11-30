//
//  Viewcontroller7.h
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/25.
//

#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
typedef void(^clickBlock)(NSInteger type);
@interface Viewcontroller7 : UIViewController

@end

NS_ASSUME_NONNULL_END

@interface RandomView : UIView
@property (nonatomic, copy) clickBlock _Nullable block;
- (void)setAnimate:(NSString *_Nullable)animateString;
@end
