import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="file"
export default class extends Controller {
  static targets = ["input", "preview"];

  preview() {
    let file = this.inputTarget.files[0];
    let reader = new FileReader();
    let preview = this.previewTarget;

    reader.onload = () => {
      preview.src = reader.result
    }

    reader.readAsDataURL(file);
  }
}
