"use strict";

var React = require("react");
var Link = require('next/link').default;

exports.link = function() {
  return function(props) {
    //props.children = React.createElement.apply(null, [React.Fragment, {}].concat(props.children));
    return React.createElement(Link, props);
  }
}
