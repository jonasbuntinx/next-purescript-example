import Document from 'next/document';
import { render } from '../output/Custom.Document/index.js';

export default class MyDocument extends Document {
  render = render;
}
