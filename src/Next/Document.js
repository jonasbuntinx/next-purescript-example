var document = require('next/document');

exports._html = document.Html;

exports._head = document.Head;

exports._main = document.Main;

exports._nextScript = document.NextScript;

exports._unsafeDocument = function(getInitialProps, component) {
  component.headTagsMiddleware = document.default.headTagsMiddleware;
  component.bodyTagsMiddleware = document.default.bodyTagsMiddleware;
  component.htmlPropsMiddleware = document.default.htmlPropsMiddleware;
  component.getInitialProps = getInitialProps;
  component.renderDocument = document.default.renderDocument;
  return component;
};
