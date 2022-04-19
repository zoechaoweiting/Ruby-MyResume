// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus";
import EasyMDE from "easymde";
import "easymde/dist/easymde.min.css";

export default class extends Controller {
  initialize() {
    this.editor = null;
  }

  connect() {
    this.editor = new EasyMDE({ element: this.element, spellChecker: false });
  }

  disconnect() {
    this.editor.toTextArea();
    this.editor = null;
  }
}
