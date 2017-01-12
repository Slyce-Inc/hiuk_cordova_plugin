#import <Cordova/CDV.h>
#import <HKSetupSDK/HKSetupSDK.h>

#import "Hiku.h"


#define EMAIL @"<email_address_here>"
#define APPID @"<app_id_here>"
#define SHARED @"<shared_secret_here>"


@implementation HikuPlugin

@property (strong, nonatomic) HKSetupSDK* sdk;
@property (nonatomic) BOOL shouldHideStatusBar;


- (HikuPlugin*)pluginInitialize
{
    _sdk = [[HKSetupSDK alloc] initWithAppId:APPID shared:SHARED email:EMAIL];
    _sdk.show_status_bar = [UIApplication sharedApplication].statusBarHidden;
    _sdk.delegate = self;
}


- (void) logoutUser:(CDVInvokedUrlCommand*)command
{
    [_sdk logoutUser];
    
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}


- (void) getApplicationTokenForUser:(CDVInvokedUrlCommand*)command
{
    (NSString) applicationToken = nil;
    CDVPluginResult* pluginResult = nil;

    applicationToken = [_sdk getApplicationTokenForUser];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:applicationToken];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void) launchTipsFlow:(CDVInvokedUrlCommand*)command
{
    [_sdk launchTipsFlow:self];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) loginUserWithEmail:(CDVInvokedUrlCommand*)command
{
    NSDictionary* options = [command.arguments objectAtIndex:0];
    NSString* email      = [options objectForKey:@"email"];
    NSString* password   = [options objectForKey:@"password"];

    [_sdk loginUserWithEmail:email password:password];
}

- (void) startSetup:(CDVInvokedUrlCommand*)command
{
    [_sdk startSetup:[UIApplication sharedApplication].delegate.window.rootViewController withPresentationStyle:SDKHKPRESENTATION_MODAL];
}




@end


