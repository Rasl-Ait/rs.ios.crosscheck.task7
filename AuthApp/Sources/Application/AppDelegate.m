//
//  AppDelegate.m
//  AuthApp
//
//  Created by rasul on 7/3/21.
//

#import "AppDelegate.h"
#import "AuthViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] init];
	self.window.frame = [UIScreen mainScreen].bounds;
	AuthViewController *rootViewController = [[AuthViewController alloc] init];
	self.window.rootViewController = rootViewController;
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	return YES;
}

@end
