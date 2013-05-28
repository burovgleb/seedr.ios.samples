//
//  Seedr.h
//  Seedr
//
//  Created by  Developer on 19.09.12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SEEDR_GENDER_MALE @"M"
#define SEEDR_GENDER_FEMALE @"F"

enum {
    SeedrPresentTypeModal,
    SeedrPresentTypeCustom,
};
typedef int SeedrPresentType;

@class SeedrView;
@class SeedrPrivate;

@protocol SeedrDelegate <NSObject>

- (void)onSessionStarted;

- (void)adWillPresent:(NSString *)space;
- (void)adWillDismiss:(NSString *)space;
- (void)adDidDismiss:(NSString *)space;
- (void)rewardForSpace:(NSString *)space;
- (void)onReceivedAdForSpace:(NSString*)space;
- (void)onAdRemovedForSace:(NSString*)space;
- (BOOL)shouldRemovedForSace:(NSString*)space;

@end

@interface Seedr : NSObject

//Set seedr delegate to track handle events
@property (nonatomic, assign)id<SeedrDelegate> delegate;
//Set supported interface oriantations
@property (nonatomic, retain)NSArray* supportdedOrientations;
//Allow seedr to show reward message
@property (nonatomic, assign)BOOL showReward;
//Set reward image
@property (nonatomic, retain)UIImage* rewardImage;
//Set reward text
@property (nonatomic, retain)NSString* rewardText;
//Enable or diable test ads
@property (nonatomic, assign)BOOL testAdsEnabled;

//Set your user's id
@property (nonatomic, retain)NSString* userID;
//Set your user's age
@property (nonatomic, assign)NSNumber* age;
//Set your user's gender. Allowable values are @"M" or @"F"
@property (nonatomic, retain)NSString* gender;

//Shared seedr instance
//Note - you dont need to create yor own seedr instance
+ (Seedr*)instance;
//Returns current seedr version
+ (NSString *)seedrVersion;
- (BOOL)isSessionStarted;

- (void)startSessionWithApiKey:(NSString*)apiKey;
- (void)initialize:(UIViewController*)rootViewControllerOrNil;

- (void)requestAdForSpace:(NSString*)space;
- (void)showAdForSpace:(NSString*)spaceOrNil presentType:(SeedrPresentType)type;
- (void)removeAdFromSpace:(NSString*)spaceOrNil;
- (BOOL)isAdAvailableForSpace:(NSString*)spaceOrNil;

- (UIView*)createVideoViewForSpace:(NSString*)spaceOrNil size:(CGSize)sz;
- (void)destroyCurrentView;

@end
