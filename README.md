seedr.ios
=========

Seedr iOS SDK 

You can serve video ads very quickly and with little effort using Seedr iOS SDK.

  Download the Seedr iOS SDK.
  Add the Seedr libs to your project.
  Incorporate the following two lines of Seedr code: 

#import "Seedr.h"
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  [[Seedr instance] startSessionWithApiKey:@"YOUR_API_KEY"];
	// Pointer to your rootViewController
	[[Seedr instance] initialize:self.window.rootViewController];
	// Your code
}

/**
 *   Ad shows as popup with video. You should request ad beforehand.
 */
 - (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
 
	// Register yourself as a delegate for ad callbacks
	[[Seedr instance] setDelegate:self];
 
  // Fetch ads early when a later display is likely. For 
  // example, at the beginning of a level. 
	[[Seedr instance] requestAdForSpace:@”SEEDR_DEFAULTSPACE”];
}

/**
 *   You will be notified when ad is ready
 */
- (void)onReceivedAdForSpace:(NSString*)space;

/**
 *  Invoke a takeover at a natural pause in your app. For example, when a
 *  level is completed, an article is read or a button is pressed.	
 */
 
- (void)showAd
{
	// Check if ad is ready. If so, display the ad
    if ([[Seedr instance] isAdAvailableForSpace:SEEDR_DEFAULTSPACE])
    {
        [[Seedr instance] showAdForSpace:SEEDR_DEFAULTSPACE presentType:SeedrPresentTypeCustom];
    }
}

/**
 *  Use callbacks to track app state.
 */
// use it for pause your app
- (void)adWillPresent:(NSString *)space;
// use it for resume your app
- (void)adDidDismiss:(NSString *)space;
// use it for reward user after playing video
- (void)rewardForSpace:(NSString *)space;
