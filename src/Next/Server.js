"use strict";

var Document = require('next/document').default;

exports._unsafeDocument = function(getInitialProps, component) {
  component.headTagsMiddleware = Document.headTagsMiddleware;
  component.bodyTagsMiddleware = Document.bodyTagsMiddleware;
  component.htmlPropsMiddleware = Document.htmlPropsMiddleware;
  component.getInitialProps = getInitialProps;
  component.renderDocument = Document.renderDocument;
  return component;
};
