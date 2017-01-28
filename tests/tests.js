exports.defineAutoTests = function() {
  
  var fail = function (done) {
    expect(true).toBe(false);
    done();
  },
  succeed = function (done) {
    expect(true).toBe(true);
    done();
  };

  describe('Plugin availability', function () {
    it("Hiku should exist", function() {
      expect(Hiku).toBeDefined();
    });
  });

  describe('API functions', function () {
    it("should define initWithParameters", function() {
      expect(Hiku.initWithParameters).toBeDefined();
    });
  });
  
  describe('API functions', function () {
    it("should define loginUserWithEmail", function() {
      expect(Hiku.loginUserWithEmail).toBeDefined();
    });
  });
  
  describe('API functions', function () {
    it("should define initWithAppId", function() {
      expect(Hiku.initWithAppId).toBeDefined();
    });
  });
  
  describe('API functions', function () {
    it("should define startSetup", function() {
      expect(Hiku.startSetup).toBeDefined();
    });
  });
  
  describe('API functions', function () {
    it("should define logoutUser", function() {
      expect(Hiku.logoutUser).toBeDefined();
    });
  });
  
  describe('API functions', function () {
    it("should define launchTipsFlow", function() {
      expect(Hiku.launchTipsFlow).toBeDefined();
    });
  });
};