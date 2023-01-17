import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["veggie", "season"]

  connect() {
    console.log("Hello from the crop-form Stimulus controller")
  }

  test(event) {
    console.log("TEST WORKING")
    console.log(event)
  }

  seasonSelected(event) {
    console.log("Season has been selected, refine veggie suggestions")
    console.log(event)
    // this.targets.veggie
  }

  planted_true(event) {
    console.log("Planted is true, show date field")
    console.log(event)
  }
}
