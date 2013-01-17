//
//  AppDelegate.h
//  VideoStreamingTest
//
//  Created by Developer on 15.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "SeedrDelegate.h"

@class ViewController;
@protocol  SeedrDelegate;


@interface AppDelegate : UIResponder <UIApplicationDelegate, SeedrDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
