//
//  AppDelegate.m
//  multi-thread-demo
//
//  Created by 宋君平 on 2021/10/8.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    _window.rootViewController = navi;
    [_window makeKeyAndVisible];
    return YES;
}


@end
