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
}

@property (nonatomic,retain)MPMoviePlayerViewController* moviePlayerViewController;
- (IBAction)onButton:(id)sender;

@end
