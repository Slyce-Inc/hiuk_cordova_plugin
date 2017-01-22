#import <Cordova/CDV.h>
#import "hiku.h"



@implementation Hiku



- (void)initWithAppId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* options = [command.arguments objectAtIndex:0];

    NSString* apiId = [self.commandDelegate.settings objectForKey:[@"appIdHikuApi" lowercaseString]];
    NSString* shared = [self.commandDelegate.settings objectForKey:[@"shareHikudApi" lowercaseString]];
    NSString* email      = [options objectForKey:@"email"];
    
    _sdk = [[HKSetupSDK alloc] initWithAppId:apiId shared:shared email:email];
    _sdk.show_status_bar = [UIApplication sharedApplication].statusBarHidden;
    _sdk.delegate = self;

}


- (void)initWithParameters:(CDVInvokedUrlCommand*)command
{
    //NSDictionary* parameters = 

}

- (void) loginUserWithEmail:(CDVInvokedUrlCommand*)command
{
    NSDictionary* options = [command.arguments objectAtIndex:0];
    NSString* email      = [options objectForKey:@"email"];
    NSString* password   = [options objectForKey:@"password"];

    [_sdk loginUserWithEmail:email password:password];
}

- (void)logoutUser:(CDVInvokedUrlCommand*)command
{
    [_sdk logoutUser];
    _delegateCommand = command;
}

- (void)getApplicationTokenForUser:(CDVInvokedUrlCommand*)command
{
    NSString* applicationToken = nil;
    CDVPluginResult* pluginResult = nil;

    applicationToken = [_sdk getApplicationTokenForUser];
    
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:applicationToken];

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)launchTipsFlow:(CDVInvokedUrlCommand*)command
{
    [_sdk launchTipsFlow:self.viewController];

    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void) startSetup:(CDVInvokedUrlCommand*)command
{
    [_sdk startSetup:[UIApplication sharedApplication].delegate.window.rootViewController withPresentationStyle:SDKHKPRESENTATION_MODAL];
}


- (void)applicationAuthorizationStatus:(BOOL)success sdk:(HKSetupSDK *)sdk{
    

}
- (void)userAuthenticationStatus:(BOOL)success sdk:(HKSetupSDK *)sdk{
    
    
    if(_delegateCommand){
        CDVPluginResult *pluginResult = nil;
        if(success){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        }
    
        [self.commandDelegate sendPluginResult:pluginResult callbackId:_delegateCommand.callbackId];
        _delegateCommand = nil;
    }
}
- (void)deviceSetupStatus:(BOOL)success sdk:(HKSetupSDK *)sdk{

}
- (void)userCancelledSetup:(HKSetupSDK *)sdk{

}
- (void)userCompletedTutorial:(HKSetupSDK *)sdk{

}
- (void)userLoggedOut:(HKSetupSDK *)sdk{

}





@end


