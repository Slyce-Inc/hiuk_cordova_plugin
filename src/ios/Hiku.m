#import <Cordova/CDV.h>
#import "hiku.h"



@implementation Hiku


- (void)initWithAppId:(CDVInvokedUrlCommand*)command
{
    NSDictionary* options = [command.arguments objectAtIndex:0];
    NSString* email      = [options objectForKey:@"email"];
    NSString* appId      = [options objectForKey:@"appId"];
    NSString* appShared      = [options objectForKey:@"appShared"];
    
    _sdk = [[HKSetupSDK alloc] initWithAppId:appId shared:appShared email:email];
    _sdk.show_status_bar = [UIApplication sharedApplication].statusBarHidden;
    _sdk.delegate = self;
    
    _callbackId = command.callbackId;
}


- (void)initWithParameters:(CDVInvokedUrlCommand*)command
{
    NSDictionary* options = [command.arguments objectAtIndex:0];
    NSString* email      = [options objectForKey:@"email"];
    NSString* appId      = [options objectForKey:@"appId"];
    NSString* appShared      = [options objectForKey:@"appShared"];

    // sdkParameters dictionary should have the following format:
    //     @{
    //         @"app_id" : <NSString>, // mandatory
    //         @"shared_secret" : <NSString>, // mandatory
    //         @"email" : <NSString>, // optional, defaulted to @""
    //         @"partner_logo" : <UIImage>, // optional, defaulted to nil
    //         @"show_status_bar" : <BOOL> // optional, defaulted to YES
    //      }
    NSDictionary* parameters = @{
         @"app_id" : appId, // mandatory
         @"shared_secret" : appShared, // mandatory
         @"email" : email
    };
    
    _sdk = [[HKSetupSDK alloc] initWithParameters:parameters];
    _sdk.delegate = self;
}

- (void) loginUserWithEmail:(CDVInvokedUrlCommand*)command
{
    NSDictionary* options = [command.arguments objectAtIndex:0];
    NSString* email      = [options objectForKey:@"email"];
    NSString* password   = [options objectForKey:@"password"];
    _callbackId = command.callbackId;
    
    
    [_sdk loginUserWithEmail:email password:password];
}

- (void)logoutUser:(CDVInvokedUrlCommand*)command
{
    [_sdk logoutUser];
    _callbackId = command.callbackId;
}

- (void)launchTipsFlow:(CDVInvokedUrlCommand*)command
{
    _callbackId = command.callbackId;
    [_sdk launchTipsFlow:self.viewController];
}

- (void) startSetup:(CDVInvokedUrlCommand*)command
{
    _callbackId = command.callbackId;
    [_sdk startSetup:self.viewController withPresentationStyle:SDKHKPRESENTATION_MODAL];
}



- (void)applicationAuthorizationStatus:(BOOL)success sdk:(HKSetupSDK *)sdk{
    NSString *token = nil;
    if(success){
        token = [sdk getApplicationTokenForUser];
    }
    
    NSDictionary *event = @{
        @"success": [NSNumber numberWithBool: success],
        @"message": [NSString stringWithFormat:@"Application authorization status: %@", success ? @"Success Authorization" : @"Failed"],
        @"token": token
    };
    
    [self sendEventToJavaScript: event];
}

- (void)userAuthenticationStatus:(BOOL)success sdk:(HKSetupSDK *)sdk{
    NSString *token = nil;
    if(success){
        token = [sdk getApplicationTokenForUser];
    }
    
    NSDictionary *event = @{
        @"success": [NSNumber numberWithBool: success],
        @"message": [NSString stringWithFormat:@"User authentication status: %@", success ? @"Success" : @"Failed"],
        @"token": token
    };
    
    [self sendEventToJavaScript: event];
}
- (void)deviceSetupStatus:(BOOL)success sdk:(HKSetupSDK *)sdk{
    NSDictionary *event = @{
        @"success": [NSNumber numberWithBool: success],
        @"message": [NSString stringWithFormat:@"Device setup status: %@",success ? @"Success" : @"Failed"]
    };
    
    [self sendEventToJavaScript: event];
}
- (void)userCancelledSetup:(HKSetupSDK *)sdk{
    NSDictionary *event = @{
        @"success": [NSNumber numberWithBool: YES],
        @"message": @"User cancelled setup"
    };
    
    [self sendEventToJavaScript: event];
}
- (void)userCompletedTutorial:(HKSetupSDK *)sdk{
    NSDictionary *event = @{
       @"success": [NSNumber numberWithBool: YES],
       @"message": @"User completed the tutorial"
    };
    
    [self sendEventToJavaScript: event];
}
- (void)userLoggedOut:(HKSetupSDK *)sdk{
    NSDictionary *event = @{
        @"success": [NSNumber numberWithBool: YES],
        @"message": @"User logged out"
    };
    
    [self sendEventToJavaScript: event];
}



- (void) sendEventToJavaScript: (NSDictionary*) event
{
    CDVPluginResult *pluginResult = nil;
    if([event objectForKey:@"success"]){
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary: event];
    }else{
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsDictionary: event];
    }
    
    // Send result.
    [pluginResult setKeepCallback: [NSNumber numberWithBool: YES]];
    [self.commandDelegate sendPluginResult: pluginResult callbackId: _callbackId];
}



@end


