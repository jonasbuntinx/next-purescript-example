var document = require("next/document");

exports._html = document.Html;

exports._head = document.Head;

exports._main = document.Main;

exports._nextScript = document.NextScript;

exports._unsafeDocument = function(component) {
  component.headTagsMiddleware = document.default.headTagsMiddleware;
  component.getInitialProps = document.default.getInitialProps;
  component.renderDocument = document.default.renderDocument;
  return component;
};
