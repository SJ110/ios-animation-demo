//
//  AppDelegate.m
//  AnimationDemoPlus
//
//  Created by 宋君平 on 2021/9/12.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.rootViewController = navi;
    [_window makeKeyAndVisible];
    return YES;
}


#pragma mark - UISceneSession lifecycle

@end
