import { default as router } from "next/router";

export function _on(event) {
  return function(cb) {
    return function() {
      router.events.on(event, cb);
    };
  };
};

export function _off(event) {
  return function(cb) {
    return function() {
      router.events.off(event, cb);
    };
  };
};
