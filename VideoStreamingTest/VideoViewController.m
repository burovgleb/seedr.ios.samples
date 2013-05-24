//
//  VideoViewController.m
//  ctrl.lc
//
//  Created by Developer on 04.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VideoViewController.h"
#import "Seedr.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

@synthesize moviePlayerViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setFrame:[UIScreen mainScreen].bounds];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playbackStateDidChange:)
                                                 name:@"MPAVControllerPlaybackStateChangedNotification"
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(logNotify:)
                                                 name:nil
                                               object:nil];
    
    //[self performSelector:@selector(showAd) withObject:nil afterDelay:1];
    

}

- (void)showAd
{
    if ([[Seedr instance] isAdAvailableForSpace:nil])
    {
        [[Seedr instance] showAdForSpace:nil presentType:SeedrPresentTypeCustom];
    }
}

- (void)playbackStateDidChange:(NSNotification*)b
{
    _label.text = [_label.text stringByAppendingString:[NSString stringWithFormat:@"%@: %d\n", @"state changed", [[b.userInfo objectForKey:@"MPAVControllerNewStateParameter"] intValue]]];
}

- (void)logNotify:(NSNotification*)b
{
//    if(![b.name isEqualToString:@"MPAVControllerTickNotification"])
//        NSLog(b.name);
}

- (void)playVideo:(NSURL*)_urlToLoad
{
    if (_urlToLoad)
    {
        
        MPMoviePlayerViewController *mp = [[MPMoviePlayerViewController alloc] initWithContentURL:_urlToLoad];
        [self presentModalViewController:mp animated:YES];
        
    }
}

- (void)onClosed
{

}

- (void)viewDidUnload
{
    [_label release];
    _label = nil;
    [_switcher release];
    _switcher = nil;
    [_segmentsGender release];
    _segmentsGender = nil;
    [_textAge release];
    _textAge = nil;
    [_textUserId release];
    _textUserId = nil;
    [super viewDidUnload];

    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;// interfaceOrientation == UIInterfaceOrientationPortrait;;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return CurrentUIInterfaceOrientation;
}

- (BOOL)shouldAutorotate
{
    return YES;
    UIInterfaceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        return YES;
    }
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return CurrentUIInterfaceOrientationMask;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.moviePlayerViewController = nil;
    [_label release];
    [_switcher release];
    [_segmentsGender release];
    [_textAge release];
    [_textUserId release];
    [super dealloc];
}

- (IBAction)onButton:(id)sender
{
    [Seedr instance].showReward = _switcher.on;
    [self showAd];
}

- (IBAction)onApply:(id)sender
{
    int age = [_textAge.text intValue];
    if (age != 0)
        [Seedr instance].age = @(age);
    if (_textUserId.text.length > 0)
        [Seedr instance].userID = _textUserId.text;
    [Seedr instance].gender = _segmentsGender.selectedSegmentIndex == 0?@"M":@"F";
    
    [self onBackground:nil];
}

- (IBAction)onBackground:(id)sender
{
    [_textAge resignFirstResponder];
    [_textUserId resignFirstResponder];
}

@end
