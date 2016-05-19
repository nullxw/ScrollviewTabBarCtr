//
//  AppDelegate.m
//  ScrollviewTabBarCtr
//
//  Created by biznest on 15/7/7.
//  Copyright (c) 2015年 biznest. All rights reserved.
//

#import "AppDelegate.h"
#import "XFTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIViewController *viewCtr1  = [[UIViewController alloc] init];
    UIViewController *viewCtr2  = [[UIViewController alloc] init];
    UIViewController *viewCtr3  = [[UIViewController alloc] init];
    UIViewController *viewCtr4  = [[UIViewController alloc] init];
    UIViewController *viewCtr5  = [[UIViewController alloc] init];
    UIViewController *viewCtr6  = [[UIViewController alloc] init];
    UIViewController *viewCtr7  = [[UIViewController alloc] init];
    UIViewController *viewCtr8  = [[UIViewController alloc] init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:viewCtr1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:viewCtr2];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:viewCtr3];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:viewCtr4];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:viewCtr5];
    UINavigationController *nav6 = [[UINavigationController alloc] initWithRootViewController:viewCtr6];
    UINavigationController *nav7 = [[UINavigationController alloc] initWithRootViewController:viewCtr7];
    UINavigationController *nav8 = [[UINavigationController alloc] initWithRootViewController:viewCtr8];
    
    NSArray *navs = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nav5, nav6, nav7, nav8, nil];
    NSArray *viewCtrs = [NSArray arrayWithObjects:viewCtr1, viewCtr2, viewCtr3, viewCtr4, viewCtr5, viewCtr6, viewCtr7, viewCtr8, nil];
    for (int i = 0; i < viewCtrs.count; i ++) {
        UIViewController *ctr = viewCtrs[i];
        ctr.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
        ctr.title = [NSString stringWithFormat:@"%d",i];
        ctr.tabBarItem.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]];
        ctr.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"_%d",i + 1]];
    }
    
    XFTabBarController *tabBarCtr = [[XFTabBarController alloc] init];
    tabBarCtr.viewControllers = navs;
    self.window.rootViewController = tabBarCtr;

//    UITabBarController *tabCtr = [[UITabBarController alloc] init];
//    tabBarCtr.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nav5, nav6, nav7, nav8, nil];
//    self.window.rootViewController = tabCtr;


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
