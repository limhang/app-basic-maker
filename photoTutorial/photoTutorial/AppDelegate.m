//
//  AppDelegate.m
//  photoTutorial
//
//  Created by het on 2017/5/23.
//  Copyright © 2017年 jacob. All rights reserved.
//

#import "AppDelegate.h"
#import "RootTabViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    RootTabViewController *rootVc = [[RootTabViewController alloc]init];
    [self.window setRootViewController:rootVc];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    //设置导航条样式
    [self customizeInterface];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark-private-method
- (void)customizeInterface
{
    //    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    //    [navigationBarAppearance setBackgroundImage:[UIImage imageWithColor:[NSObject baseURLStrIsProduction]? kColorNavBG: kColorBrandGreen] forBarMetrics:UIBarMetricsDefault];
    //    [navigationBarAppearance setTintColor:[UIColor colorWithHexString:@"0x3bbc79"]];//返回按钮的箭头颜色
    //    NSDictionary *textAttributes = @{
    //                                     NSFontAttributeName: [UIFont systemFontOfSize:kNavTitleFontSize],
    //                                     NSForegroundColorAttributeName: kColorNavTitle,
    //                                     };
    //    [navigationBarAppearance setTitleTextAttributes:textAttributes];
    
    //设置返回按钮
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
}

@end
