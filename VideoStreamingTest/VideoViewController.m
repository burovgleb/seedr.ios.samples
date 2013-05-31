//
//  VideoViewController.m
//  ctrl.lc
//
//  Created by Developer on 04.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "VideoViewController.h"
#import "Seedr.h"
#import <CoreLocation/CoreLocation.h>

#define scrollminh self.view.frame.size.height - 216
#define scrollmaxh self.view.frame.size.height

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect r = [UIScreen mainScreen].bounds;
    r.origin = CGPointMake(0, 0);
    [self.view setFrame:r];
    //[_viewScrollContent setFrame:r];
    
    [_scroll addSubview:_viewScrollContent];
    [_scroll setContentSize:_viewScrollContent.frame.size];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    
    [_scroll setScrollEnabled:YES];
    _scroll.frame = r;
}

- (void)onKeyboardShow:(NSNotification*)notify
{
    [self setScrollMinimal];
}

- (void)onKeyboardHide:(NSNotification*)notify
{
    [self setScrollMaximum];
}

- (void)setScrollMinimal
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:ANIM_LENGTH];
    [UIView setAnimationCurve:ANIM_KCURVE];
    [_scroll setFrame:CGRectMake(0, 0, self.view.frame.size.width, scrollminh)];
    [UIView commitAnimations];
}

- (void)setScrollMaximum
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:ANIM_LENGTH];
    [UIView setAnimationCurve:ANIM_KCURVE];
    [_scroll setFrame:CGRectMake(0, 0, self.view.frame.size.width, scrollmaxh)];
    [UIView commitAnimations];
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
    [_switcherSeparate release];
    _switcherSeparate = nil;
    [_viewSeparate release];
    _viewSeparate = nil;
    [_viewScrollContent release];
    _viewScrollContent = nil;
    [_scroll release];
    _scroll = nil;
    [_buttonDestroy release];
    _buttonDestroy = nil;
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
    [_switcherSeparate release];
    [_viewSeparate release];
    [_viewScrollContent release];
    [_scroll release];
    [_buttonDestroy release];
    [super dealloc];
}

- (IBAction)onButton:(id)sender
{
    if (_viewSeparate.subviews.count != 0) 
        return;
    
    if (_switcherSeparate.on)
    {
        _buttonDestroy.enabled = YES;
        
        [_viewSeparate addSubview:[[Seedr instance] createVideoViewForSpace:nil size:_viewSeparate.frame.size]];
        
    }
    else
    {
        [Seedr instance].showReward = _switcher.on;
        [self showAd];
    }
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

- (IBAction)onRequestLoaction:(id)sender
{
    [[CLLocationManager new] startUpdatingLocation];
}

- (IBAction)onDestroy:(id)sender
{
    [[_viewSeparate.subviews objectAtIndex:0] removeFromSuperview];
    [[Seedr instance] destroyCurrentView];
    _buttonDestroy.enabled = NO;
}

@end
