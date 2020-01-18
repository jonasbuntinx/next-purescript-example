import Document from 'next/document';
import { render } from '../output/Document/index.js';

export default class extends Document {
  render = render;
}
