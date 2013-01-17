//
//  ViewController.m
//  VideoStreamingTest
//
//  Created by Developer on 15.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "VideoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.view setFrame:[UIScreen mainScreen].bounds];
    
    VideoViewController* vvc = [[VideoViewController alloc] init];
    [self.view addSubview:vvc.view];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return interfaceOrientation == UIInterfaceOrientationPortrait;//	return YES;
	
	// Unsupported orientations:
	// UIInterfaceOrientationPortrait, UIInterfaceOrientationPortraitUpsideDown
	return NO;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
