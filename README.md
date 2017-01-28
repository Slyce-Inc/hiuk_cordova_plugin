# hiku-cordova-plugin

Cordova iOS plugin for HikuSetupSDK


1. [Description](https://github.com/barteku/hiku-cordova-plugin.git#1-description)
2. [Installation](https://github.com/barteku/hiku-cordova-plugin.git#2-installation)
	2. [Automatically](https://github.com/barteku/hiku-cordova-plugin.git#automatically)
3. [Usage](https://github.com/barteku/hiku-cordova-plugin.git#3-usage)


## 1. Description

This plugins allows you to make use of HikuSetupSDK

* Works with Cordova >= 5.0.0

### iOS specifics
* Supported methods: `initWithParameters`, `initWithAppId`, `startSetup`, `loginUserWithEmail`,  `logoutUser`, `launchTipsFlow`
* initWithParameters, initWithAppId initiates SDK
* startSetup allows to create a user account
* All methods return data in callbacks if needed
* Plugin using some libraries from cocoapods with cordova-plugin-cocoapod-support

 


## 2. Installation

### Automatically
Latest github version
```
cordova plugin add https://github.com/barteku/hiku-cordova-plugin.git
``````
After installing plugin, build required
```
cordova build ios
``````
Build may fail for some reason, please try xcode build when occurs.




## 3. Usage

The table gives an overview of basic operation compatibility:

Operation                           | Comment                | iOS | Android
----------------------------------- | ---------------------- | --- | -------
initWithParameters                  | SDK init only          | yes | 
initWithAppId                       | SDK init only          | yes | 
startSetup                          | interactive            | yes | 
loginUserWithEmail                  | (email, password)      | yes | 
logoutUser                          |                        | yes | 
launchTipsFlow                      | interactive            | yes | 



Basic operations, you'll want to copy-paste this for testing purposes:
```js

    var success = function(d){console.log(d)};
    var failure = function(e){console.log(e)}

    Hiku.initWithParameters(success, failure, {appId: 'XXX', addSecret: 'XXXX'});
    Hiku.startSetup(success, failure);
    Hiku.launchTipsFlow(success, failure);
