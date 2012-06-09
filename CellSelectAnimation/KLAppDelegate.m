//
//  KLAppDelegate.m
//  CellSelectAnimation
//
//  Created by Kyle LeNeau on 6/8/12.
//  Copyright (c) 2012 LeNeau Software. All rights reserved.
//

#import "KLAppDelegate.h"
#import "KLViewController.h"

@implementation KLAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    KLViewController *tableController = [[KLViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableController];
    
    self.navigationController = navController;
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
