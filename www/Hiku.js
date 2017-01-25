

var exec = require('cordova/exec');

function Hiku() {
	this.serviceName = "Hiku";
};


Hiku.prototype.initWithParameters = function(successCallback, failureCallback, parameters){
    exec(successCallback, failureCallback, this.serviceName, "initWithParameters", [parameters]);
};


Hiku.prototype.initWithAppId = function(successCallback, failureCallback, parameters){
    exec(successCallback, failureCallback, this.serviceName, "initWithAppId", [parameters]);
};

Hiku.prototype.startSetup = function(successCallback, failureCallback){
    exec(successCallback, failureCallback, this.serviceName, "startSetup");
};

Hiku.prototype.loginUserWithEmail = function(successCallback, failureCallback, email, password){
    exec(successCallback, failureCallback, this.serviceName, "loginUserWithEmail", [email, password]);
};

Hiku.prototype.logoutUser = function(successCallback, failureCallback){
    exec(successCallback, failureCallback, this.serviceName, "logoutUser");
};

Hiku.prototype.launchTipsFlow = function(successCallback, failureCallback){
    exec(successCallback, failureCallback, this.serviceName, "launchTipsFlow");
};




module.exports = new Hiku();

