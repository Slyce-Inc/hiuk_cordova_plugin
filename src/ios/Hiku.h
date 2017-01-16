
#import <Cordova/CDVPlugin.h>

@interface Hiku : CDVPlugin

@property (strong, nonatomic) HKSetupSDK* sdk;
@property (nonatomic) BOOL shouldHideStatusBar;



- (Hiku*)pluginInitialize;

- (void) logoutUser:(CDVInvokedUrlCommand*)command;

- (void) getApplicationTokenForUser:(CDVInvokedUrlCommand*)command;

- (void) launchTipsFlow:(CDVInvokedUrlCommand*)command; 

- (void) loginUserWithEmail:(CDVInvokedUrlCommand*)command;

- (void) startSetup:(CDVInvokedUrlCommand*)command;



@end
