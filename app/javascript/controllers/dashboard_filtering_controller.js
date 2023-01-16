import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard-filtering"
export default class extends Controller {
  static targets = ["year-upcoming", "season-upcoming", "year-past", "season-past"]
  connect() {
    console.log("Hello World!");
  }
}
