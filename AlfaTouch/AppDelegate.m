//
//  AppDelegate.m
//  AlfaTouch
//
//  Created by Estevan Hernandez on 7/16/15.
//  Copyright (c) 2015 Estevan Hernandez. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "AddViewController.h"
#import "ChecklistTableViewController.h"
#import "ProfileViewController.h"
@import EventKit;
@import UIKit;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    EKEventStore *store = [[EKEventStore alloc] init];
    //NSLog(@"yay launch");
    
    AddViewController       *addViewController = [[AddViewController alloc] init];
    UINavigationController  *addNavController = [[UINavigationController alloc]
                                                 initWithRootViewController:addViewController];
    [addNavController setTitle:@"+Add"];
    
    ChecklistTableViewController *checklistTableViewController = [[ChecklistTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController  *checklistNavController = [[UINavigationController alloc]
                                                       initWithRootViewController:checklistTableViewController];
    [checklistNavController setTitle:@"Checklist"];
    
    ProfileViewController   *profileViewController = [[ProfileViewController alloc] init];
    UINavigationController  *profileNavController = [[UINavigationController alloc]
                                                     initWithRootViewController:profileViewController];
    [profileNavController setTitle:@"Profile"];
    
    UITabBarController      *tabController = [[UITabBarController alloc] init];
    [tabController setViewControllers:@[addNavController, checklistNavController, profileNavController]];
    tabController.view.tintColor = [UIColor colorWithRed:1.0 green:0.75 blue:0.75 alpha:1];
    //self.window.tintColor = [UIColor orangeColor];
    profileNavController.view.tintColor = [UIColor redColor];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error){}];
    
    
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

- (void)requestAccessToEntityType:(EKEntityType)entityType
                       completion:(EKEventStoreRequestAccessCompletionHandler)completion {
    
}

@end
