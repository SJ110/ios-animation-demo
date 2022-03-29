//
//  AppDelegate.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/8.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <objc/runtime.h>

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    _window.rootViewController = navi;
    [_window makeKeyAndVisible];
    UIWindow *keywin = [UIApplication sharedApplication].keyWindow;
    /// 此处找不到,因为还没设置keywindow,到applicationDidBecomeActive就找得到
    if (@available(iOS 13.0,*)) {
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in windowScene.windows) {
                    if (window.keyWindow) {
                        keywin = window;
                        break;
                    }
                }
            }
        }
    }
    NSLog(@"+++%@",navi);
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    UIWindow *keywin = [UIApplication sharedApplication].keyWindow;
    if (@available(iOS 13.0,*)) {
        for (UIWindowScene *windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                for (UIWindow *window in windowScene.windows) {
                    if (window.keyWindow) {
                        keywin = window;
                        break;
                    }
                }
            }
        }
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s",__func__);
    [super touchesBegan:touches withEvent:event];
}

@end
