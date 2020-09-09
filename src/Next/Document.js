"use strict";

var document = require('next/document');

exports.htmlComponent = document.Html;

exports.headComponent = document.Head;

exports.mainComponent = document.Main;

exports.nextScriptComponent = document.NextScript;

exports._unsafeDocument = function(getInitialProps, component) {
  component.headTagsMiddleware = document.default.headTagsMiddleware;
  component.bodyTagsMiddleware = document.default.bodyTagsMiddleware;
  component.htmlPropsMiddleware = document.default.htmlPropsMiddleware;
  component.getInitialProps = getInitialProps;
  component.renderDocument = document.default.renderDocument;
  return component;
};
