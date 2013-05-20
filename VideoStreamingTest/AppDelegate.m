//
//  AppDelegate.m
//  VideoStreamingTest
//
//  Created by Developer on 15.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "VideoViewController.h"
#import "Seedr.h"

#define SEEDR_API_KEY   @"phUchaCH4qewRU2ha7952uKa8hePrAWr"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[Seedr instance] startSessionWithApiKey:SEEDR_API_KEY];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.viewController = [[[VideoViewController alloc] initWithNibName:@"VideoViewController" bundle:nil] autorelease];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    NSSetUncaughtExceptionHandler(&uncaughtExceptionHandler);
    
    
    
    
    [[Seedr instance] initialize:self.viewController];
    [Seedr  instance].testAdsEnabled = YES;
    [Seedr instance].age = @(26);
    [Seedr instance].userID = @"parampampam";
    [Seedr instance].gender = @"F";
    [[Seedr instance] requestAdForSpace:nil];
    [[Seedr instance] setDelegate:self];
    [Seedr instance].showReward = NO;
    [Seedr instance].supportdedOrientations = [NSMutableArray arrayWithObjects:[NSNumber numberWithInt:CurrentUIInterfaceOrientation], nil];
    [Seedr instance].rewardImage = [UIImage imageNamed:@"cocos2d"];
    [Seedr instance].rewardText = @"Скидка 50% на грузовое судно типа 499-24е52 \"Неутомимый афроамериканец\" в салонах \"КосмСтройТехСбыт\"!\nТолько в пределах Солнечной системы.";
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
void uncaughtExceptionHandler(NSException *exception)
{
    NSLog(@"CRASH: %@", exception);
    NSLog(@"Stack Trace: %@", [exception callStackSymbols]);
    // Internal error reporting
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - SeedrDelegate

- (void)onSessionStarted
{
    
}

- (void)adWillPresent:(NSString *)space
{}

- (void)adWillDismiss:(NSString *)space
{}

- (void)adDidDismiss:(NSString *)space
{}

- (void)rewardForSpace:(NSString *)space
{}

- (void)onReceivedAdForSpace:(NSString*)space
{}

- (void)onAdRemovedForSace:(NSString*)space
{}

- (BOOL)shouldRemovedForSace:(NSString*)space
{
    return NO;
}

@end
