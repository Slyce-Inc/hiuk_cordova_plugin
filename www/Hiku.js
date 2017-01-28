

var exec = require('cordova/exec');

function Hiku() {
	this.serviceName = "Hiku";
};

/**
 * 
 * @param function successCallback
 * @param function failureCallback
 * @param object {
 *      email : "<STRING>",
 *      appId : "<STRING>",
 *      appSecret : "<STRING>",
 *      partnerLogo : "<URL>" *      
 * } parameters
 * 
 */
Hiku.prototype.initWithParameters = function(successCallback, failureCallback, parameters){
    exec(successCallback, failureCallback, this.serviceName, "initWithParameters", [parameters]);
};

/**
 * 
 * @param function successCallback
 * @param function failureCallback
 * @param object {
 *      email : "",
 *      appId : "",
 *      appSecret : "" 
 * } parameters
 */
Hiku.prototype.initWithAppId = function(successCallback, failureCallback, parameters){
    exec(successCallback, failureCallback, this.serviceName, "initWithAppId", [parameters]);
};

/**
 * 
 * @param {type} successCallback
 * @param {type} failureCallback
 */
Hiku.prototype.startSetup = function(successCallback, failureCallback){
    exec(successCallback, failureCallback, this.serviceName, "startSetup");
};

/**
 * 
 * @param {type} successCallback
 * @param {type} failureCallback
 */
Hiku.prototype.loginUserWithEmail = function(successCallback, failureCallback, email, password){
    exec(successCallback, failureCallback, this.serviceName, "loginUserWithEmail", {'email': email, 'password':password});
};

/**
 * 
 * @param {type} successCallback
 * @param {type} failureCallback
 */
Hiku.prototype.logoutUser = function(successCallback, failureCallback){
    exec(successCallback, failureCallback, this.serviceName, "logoutUser");
};

/**
 * 
 * @param {type} successCallback
 * @param {type} failureCallback
 */
Hiku.prototype.launchTipsFlow = function(successCallback, failureCallback){
    exec(successCallback, failureCallback, this.serviceName, "launchTipsFlow");
};


module.exports = new Hiku();

