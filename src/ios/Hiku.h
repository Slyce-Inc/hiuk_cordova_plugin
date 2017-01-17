
#import <Cordova/CDVPlugin.h>
#import <HKSetupSDKFramework/include/HKSetupSDK/HKSetupSDK.h>



@interface Hiku : CDVPlugin <HKSetupDelegate>

@property (strong, nonatomic) HKSetupSDK* sdk;
@property (nonatomic) BOOL shouldHideStatusBar;


- (void)pluginInitialize;

- (void)logoutUser:(CDVInvokedUrlCommand*)command;

- (void)getApplicationTokenForUser:(CDVInvokedUrlCommand*)command;

- (void)launchTipsFlow:(CDVInvokedUrlCommand*)command;

- (void)loginUserWithEmail:(CDVInvokedUrlCommand*)command;

- (void)startSetup:(CDVInvokedUrlCommand*)command;



@end
