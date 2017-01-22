
#import <Cordova/CDVPlugin.h>
#import <HKSetupSDKFramework/include/HKSetupSDK/HKSetupSDK.h>



@interface Hiku : CDVPlugin <HKSetupDelegate>

@property (nonatomic) NSString* appId;
@property (nonatomic) NSString* appSecret;

@property (strong, nonatomic) HKSetupSDK* sdk;
@property (nonatomic) BOOL shouldHideStatusBar;

@property (strong, nonatomic) CDVInvokedUrlCommand* delegateCommand;


- (void)pluginInitialize;

- (void)logoutUser:(CDVInvokedUrlCommand*)command;

- (void)getApplicationTokenForUser:(CDVInvokedUrlCommand*)command;

- (void)launchTipsFlow:(CDVInvokedUrlCommand*)command;

- (void)loginUserWithEmail:(CDVInvokedUrlCommand*)command;

- (void)startSetup:(CDVInvokedUrlCommand*)command;

- (void)initWithAppId:(CDVInvokedUrlCommand*)command;

- (void)initWithParameters:(CDVInvokedUrlCommand*)command;


@end
