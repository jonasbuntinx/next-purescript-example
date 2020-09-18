var router = require("next/router").default;

exports._on = function(event) {
  return function(cb) {
    return function() {
      router.events.on(event, cb);
    };
  };
};

exports._off = function(event) {
  return function(cb) {
    return function() {
      router.events.off(event, cb);
    };
  };
};
