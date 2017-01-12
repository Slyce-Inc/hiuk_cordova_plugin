//
//  HKSetupSDK.h
//  HKSetupSDK
//
//  Created by Rajan Bala on 10/10/14.
//  Copyright (c) 2014 hiku labs, inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <AVFoundation/AVFoundation.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@protocol HKSetupDelegate;

@interface HKSetupSDK : NSObject


@property (strong, nonatomic) NSString* app_id;

@property (strong, nonatomic) NSString* shared;

@property (strong, nonatomic) NSString* email;

@property (strong, nonatomic) id<HKSetupDelegate> delegate;

- (id) initWithAppId:(NSString *)app_id shared:(NSString *)shared email:(NSString* )email;
- (void) startSetup;

@end


@protocol HKSetupDelegate <NSObject>

- (void) userAuthenticationStatus:(BOOL)success sdk:(HKSetupSDK *)sdk;
- (void) deviceSetupStatus:(BOOL)success sdk:(HKSetupSDK *)sdk;
- (void) userCancelledSetup:(HKSetupSDK *)sdk;
@end
