"use strict";

exports.withInitialPropsImpl = function(getInitialProps) {
  return function(component) {
    component.getInitialProps = getInitialProps;
    return component;
  };
};
