"use strict";

var React = require("react");
var Link = require('next/link').default;

exports.link = function() {
  return function(props) {
    return React.createElement(Link, props);
  }
}
