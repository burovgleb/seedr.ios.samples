//
//  VideoViewController.h
//  ctrl.lc
//
//  Created by Developer on 04.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoViewController : UIViewController<UIWebViewDelegate>
{
    IBOutlet UILabel *_label;
    UIWebView* wv;
    
    IBOutlet UISwitch *_switcher;
    IBOutlet UISwitch *_switcherSeparate;
    IBOutlet UISegmentedControl *_segmentsGender;
    IBOutlet UITextField *_textAge;
    IBOutlet UITextField *_textUserId;
    IBOutlet UIView *_viewSeparate;
    IBOutlet UIView *_viewScrollContent;
    IBOutlet UIScrollView *_scroll;
    IBOutlet UIButton *_buttonDestroy;
}

@property (nonatomic,retain)MPMoviePlayerViewController* moviePlayerViewController;
- (IBAction)onButton:(id)sender;
- (IBAction)onApply:(id)sender;
- (IBAction)onBackground:(id)sender;
- (IBAction)onRequestLoaction:(id)sender;
- (IBAction)onDestroy:(id)sender;

@end
