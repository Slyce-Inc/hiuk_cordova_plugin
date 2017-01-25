
#import <Cordova/CDVPlugin.h>
#import <HKSetupSDKFramework/include/HKSetupSDK/HKSetupSDK.h>



@interface Hiku : CDVPlugin <HKSetupDelegate>

@property (strong, nonatomic) HKSetupSDK* sdk;
@property (strong, nonatomic) NSString* callbackId;


- (void)logoutUser:(CDVInvokedUrlCommand*)command;

- (void)launchTipsFlow:(CDVInvokedUrlCommand*)command;

- (void)loginUserWithEmail:(CDVInvokedUrlCommand*)command;

- (void)startSetup:(CDVInvokedUrlCommand*)command;

- (void)initWithAppId:(CDVInvokedUrlCommand*)command;

- (void)initWithParameters:(CDVInvokedUrlCommand*)command;


@end
