"use strict";

exports.unsafeSetDisplayName = function(displayName, component) {
  component.displayName = displayName;
  component.toString = function() {
    return displayName;
  };
  return component;
};

exports.unsafeSetGetInitialProps = function(getInitialProps, component) {
  component.getInitialProps = getInitialProps;
  return component;
};
