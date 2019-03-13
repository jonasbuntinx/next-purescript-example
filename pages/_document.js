import Document from 'next/document';
import { render } from '../output/Custom.Document/index.js';

function MyDocument() {
  return Document.apply(this, arguments) || this;
};

MyDocument.prototype = Object.create(Document.prototype);
MyDocument.prototype.constructor = MyDocument;
MyDocument.__proto__ = Document;
MyDocument.prototype.render = render;

export default MyDocument;
