//
//  NavigationControllerTransitioning.h
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/11/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavigationControllerTransitioning : NSObject <UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) NSInteger type;
@end

NS_ASSUME_NONNULL_END
