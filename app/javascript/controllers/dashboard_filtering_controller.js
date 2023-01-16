import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard-filtering"
export default class extends Controller {
  static targets = ["season-upcoming", "season-past", "year-past"]
  connect() {
    console.log(this.element);
  }

  filterBySeason(event) {
    console.log(event.currentTarget.value)
  }
}
