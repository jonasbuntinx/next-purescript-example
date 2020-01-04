"use strict";

exports.unsafeSetGetInitialProps = function(getInitialProps, component) {
  component.getInitialProps = getInitialProps;
  return component;
};
