//
//  UIViewController+UIViewControllerExtension.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2022/1/4.
//

#import "UIViewController+UIViewControllerExtension.h"

@implementation UIViewController(UIViewControllerExtension)
+ (UIViewController *)currentViewController {
    UIViewController *resultVc = nil;
    UIWindow *window = nil;
    if (@available(iOS 13.0,*)) {
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *sceneWindow in windowScene.windows) {
                    if (sceneWindow.keyWindow) {
                        window = sceneWindow;
                        break;
                    }
                }
            }
        }
    }
    else {
        window = [UIApplication sharedApplication].delegate.window;
    }
    
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for (UIWindow *tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    if (window.subviews.count == 0) {
        return resultVc;
    }
    UIView *frontView = [window.subviews objectAtIndex:0];
    /// 顶层视图的nextresponder是容器
    id nextResponder = frontView.nextResponder;
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        resultVc = (UIViewController *)nextResponder;
    } else {
        ///否则取当前window根视图
        resultVc = window.rootViewController;
    }
    BOOL isContinue = YES;
    while (isContinue) {
        if ([resultVc isKindOfClass:[UINavigationController class]]) {
            /// 导航栏
            UINavigationController *navi = (UINavigationController *)resultVc;
            /// 返回栈顶的vc
            resultVc = navi.visibleViewController;
        } else if ([resultVc isKindOfClass:[UITabBarController class]]) {
            ///tabbar
            UITabBarController *tabBarVc = (UITabBarController *)resultVc;
            resultVc = tabBarVc.selectedViewController;
        } else if (resultVc.presentedViewController) {
            /// 模态弹出的vc
            resultVc = resultVc.presentedViewController;
        } else {
            isContinue = NO;
        }
    }
    return resultVc;
}
@end
