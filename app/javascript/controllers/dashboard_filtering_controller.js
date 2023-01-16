import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["year-upcoming", "season-upcoming", "year-past", "season-past"]
  connect() {
    this.element.textContent = "Hello World!"
  }
}
