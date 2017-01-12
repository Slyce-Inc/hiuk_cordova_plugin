
#import <Cordova/CDVPlugin.h>

@interface HikuPlugin : CDVPlugin

- (HikuPlugin*)pluginInitialize;

- (void) logoutUser:(CDVInvokedUrlCommand*)command;

- (NSString) getApplicationTokenForUser:(CDVInvokedUrlCommand*)command;

- (void) launchTipsFlow:(CDVInvokedUrlCommand*)command; 

- (void) loginUserWithEmail:(CDVInvokedUrlCommand*)command;

- (void) startSetup:(CDVInvokedUrlCommand*)command;



@end