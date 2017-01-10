//
//  AppDelegate.m
//  ULCDemo
//
//  Created by 方正 on 2016/12/23.
//  Copyright © 2016年 fang. All rights reserved.
//
#define LOGININFO @"loginSuess"
#import "AppDelegate.h"
#import "FZViewController.h"
#import "FZStoreViewController.h"
#import "FZFindViewController.h"
#import "FZSettingViewController.h"
//#import "moduleInterface.h"
#import "FZModelManager.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)loadAllModele
{
    FZModelManager *mag = [FZModelManager shareManager];
    [mag loadModule];
    
}

- (void)login{
    LoginViewController *login = [[LoginViewController alloc] init];
    login.loginSuess = ^(NSString *info ,NSError *error){
        if (!error) {
            [self loadAllModele];
            [self loadMain];
            [[NSUserDefaults standardUserDefaults] setObject:info forKey:LOGININFO];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }else{
            NSLog(@"登录失败");
        }
    };
    self.window.rootViewController = login;
    
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

    
//    NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:LOGININFO] isEqualToString:@"suess"]) {
         [self loadAllModele];
         [self loadMain];
    }else{
       [self login];
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)loadMain{
    
    FZViewController *main =[[FZViewController alloc] init];
    FZStoreViewController *store = [[FZStoreViewController alloc] init];
    FZFindViewController *find = [[FZFindViewController alloc] init];
    FZSettingViewController *set = [[FZSettingViewController alloc] init];
    
    
    UITabBarController *tableBar = [[UITabBarController alloc] init];
    
    NSMutableArray *array = [NSMutableArray new];
    UIViewController *mainVC = UIStoryBoardNamed(@"Main").instantiateInitialViewController;
    mainVC.title = @"动态";
    [array addObject:mainVC];
    
    UIViewController *storeVC = UIStoryBoardNamed(@"StoreSB").instantiateInitialViewController;
    mainVC.title = @"门店";
    [array addObject:storeVC];
    
    UIViewController *findVC = UIStoryBoardNamed(@"FindSB").instantiateInitialViewController;
    mainVC.title = @"发现";
    [array addObject:findVC];
    
    UIViewController *setVC = UIStoryBoardNamed(@"SettingSB").instantiateInitialViewController;
    mainVC.title = @"我的";
    [array addObject:setVC];
    
    tableBar.viewControllers = array;
    tableBar.selectedIndex = 0;
    
    self.window.rootViewController = tableBar;
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


@end
