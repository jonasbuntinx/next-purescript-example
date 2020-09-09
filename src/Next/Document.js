"use strict";

exports.htmlComponent = require('next/document').Html;

exports.headComponent = require('next/document').Head;

exports.mainComponent = require('next/document').Main;

exports.nextScriptComponent = require('next/document').NextScript;

var Document = require('next/document').default;

exports._unsafeDocument = function(getInitialProps, component) {
  component.headTagsMiddleware = Document.headTagsMiddleware;
  component.bodyTagsMiddleware = Document.bodyTagsMiddleware;
  component.htmlPropsMiddleware = Document.htmlPropsMiddleware;
  component.getInitialProps = getInitialProps;
  component.renderDocument = Document.renderDocument;
  return component;
};
