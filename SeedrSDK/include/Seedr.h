//
//  Seedr.h
//  Seedr
//
//  Created by  Developer on 19.09.12.
//  Copyright (c) 2012 Developer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SEEDR_DEFAULTSPACE @"SEEDR_DEFAULTSPACE"

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

- (void)adWillPresent:(NSString *)space;
- (void)adWillDismiss:(NSString *)space;
- (void)adDidDismiss:(NSString *)space;
- (void)rewardForSpace:(NSString *)space;
- (void)onReceivedAdForSpace:(NSString*)space;

@end

@interface Seedr : NSObject
{
    @private
    NSString* _myId;
    NSString* _apikey;
    NSMutableDictionary* _ads;
    UIViewController* _rootViewController;
    SeedrView* _presentView;
    
    NSMutableArray* actions;
}

@property (nonatomic, assign)id<SeedrDelegate> delegate;
@property (nonatomic, retain)NSArray* supportdedOrientations;
@property (nonatomic, assign)BOOL showReward;
@property (nonatomic, retain)UIImage* rewardImage;
@property (nonatomic, retain)NSString* rewardText;
@property (nonatomic, assign)BOOL testAdsEnabled;

@property (nonatomic, retain)NSString* userID;
@property (nonatomic, assign)int age;
@property (nonatomic, retain)NSString* gender;

+ (Seedr*)instance;
+ (NSString *)seedrVersion;

- (void)startSessionWithApiKey:(NSString*)key;
- (void)initialize:(UIViewController*)rootViewControllerOrNil;

- (void)requestAdForSpace:(NSString*)space;
- (void)showAdForSpace:(NSString*)spaceOrNil presentType:(SeedrPresentType)type;
- (void)removeAdFromSpace:(NSString*)spaceOrNil;
- (BOOL)isAdAvailableForSpace:(NSString*)spaceOrNil;

@end
