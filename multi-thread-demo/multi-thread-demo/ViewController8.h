//
//  ViewController8.h
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/12/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ViewController8 : UIViewController

@end

@interface forwardClass : NSObject
- (void)foo:(id)params;
@end

NS_ASSUME_NONNULL_END
