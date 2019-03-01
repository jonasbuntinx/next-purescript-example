"use strict";

exports.withGetInitialPropsImpl = function(getInitialProps) {
  return function(component) {
    component.getInitialProps = getInitialProps;
    return component;
  };
};
