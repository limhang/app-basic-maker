//
//  RootTabViewController.m
//  TimeKiller
//
//  Created by 李明航 on 16/10/8.
//  Copyright © 2016年 李明航. All rights reserved.
//

#import "RootTabViewController.h"
#import "RDVTabBarItem.h"
#import "BaseNavigationController.h"

//rootViewController
#import "MeViewController.h"


@interface RootTabViewController ()

@end

@implementation RootTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViewControllers];
    [self customizeTabbarForController];
}


- (void)setupViewControllers
{
    MeViewController *MeVC = [[MeViewController alloc]init];
    BaseNavigationController *vc0 = [self setupNavController:MeVC];
    
//    PhotoBaseViewController *photoBaseVC = [[PhotoBaseViewController alloc]init];
//    BaseNavigationController *vc1 = [self setupNavController:photoBaseVC];
//    
//    RemindViewController *remindVC = [[RemindViewController alloc]init];
//    BaseNavigationController *vc2 = [self setupNavController:remindVC];
//    
//    TimeAnalysisViewController *timeAna = [[TimeAnalysisViewController alloc]init];
//    BaseNavigationController *vc3 = [self setupNavController:timeAna];
//    
//    TimeManagerViewController *timeManager = [[TimeManagerViewController alloc]init];
//    BaseNavigationController *vc4 = [self setupNavController:timeManager];
    
    [self setViewControllers:@[vc0]];
 
}

- (BaseNavigationController *) setupNavController:(UIViewController *)vc
{
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
    return nav;
}

- (void)customizeTabbarForController
{
    NSArray *tabbarItemTitle = @[@"基础"];
    self.tabBar.backgroundColor = [UIColor clearColor];
    NSInteger index = 0;
    for(RDVTabBarItem *item in [[self tabBar]items]){
        [item setTitle:[tabbarItemTitle objectAtIndex:index]];
        item.selectedTitleAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor blueColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:13],NSFontAttributeName ,nil];
        
        index ++;
    }

}

@end
