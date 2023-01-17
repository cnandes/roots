import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["date"]

  connect() {
    // console.log("Hello from the crop-form Stimulus controller")
  }

  plantedChange(event) {
    if (event.target.value == "true") {
      this.dateTarget.classList.remove("d-none")
    } else {
      this.dateTarget.classList.add("d-none")
    }

  }
}
