"use strict";

var Document = require('next/document').default;

exports.unsafeSetGetInitialProps = function(getInitialProps, component) {
  component.getInitialProps = getInitialProps;
  return component;
};

exports.unsafeDocument = function(component) {
  component.headTagsMiddleware = Document.headTagsMiddleware;
  component.bodyTagsMiddleware = Document.bodyTagsMiddleware;
  component.htmlPropsMiddleware = Document.htmlPropsMiddleware;
  component.getInitialProps = Document.getInitialProps;
  component.renderDocument = Document.renderDocument;
  return component;
};
