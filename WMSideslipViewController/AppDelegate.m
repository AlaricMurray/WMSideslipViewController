//
//  AppDelegate.m
//  WMSideslipViewController
//
//  Created by 王猛 on 16/3/19.
//  Copyright © 2016年 ShiJiDuHui. All rights reserved.
//

#import "AppDelegate.h"
#import "WMSideslipController.h"
#import "WMMainController.h"
#import "WMLeftController.h"
#import "WMRightController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //1.创建子控制器
    WMLeftController *leftVC = [WMLeftController new];
    WMMainController *mainVC = [WMMainController new];
    WMRightController *rightVC = [WMRightController new];
    
    //2.创建装三个视图控制器的视图控制器
    WMSideslipController *sideslipVC = [[WMSideslipController alloc] initWithLeftViewController:leftVC andMainViewController:mainVC andRightViewController:rightVC];
    
    //2.1设置滑动速率
    sideslipVC.speed = 0.5;
    
    //2.2设置点击手势回到主控制器可用
    sideslipVC.backMainViewControllerTap.enabled = YES;
    
    self.window.rootViewController = sideslipVC;
    
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
