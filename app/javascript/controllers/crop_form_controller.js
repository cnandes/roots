import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["season", "date"]

  connect() {
    console.log("Hello from the crop-form Stimulus controller")
  }

  seasonSelected(event) {
    // console.log("Season has been selected, refine veggie suggestions")
  }

  plantedChange(event) {
    if (event.target.value == "true") {
      this.dateTarget.classList.remove("d-none")
    } else {
      this.dateTarget.classList.add("d-none")
    }

  }
}
