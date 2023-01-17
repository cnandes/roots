import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["date", "summer", "autumn", "winter", "spring", "title"]

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

  seasonSelected(event) {
    // console.log("Season has been selected")
    if (event.target.value == "Summer") {
      this.titleTarget.innerText = "🌻 ~ Summer Veggies ~ 🌻"
      this.hideSeasonTargets
      this.summerTarget.classList.remove("d-none")
    } else if (event.target.value == "Autumn") {
      this.titleTarget.innerText = "🍁 ~ Autumn Veggies ~ 🍁"
      this.autumnTarget.classList.remove("d-none")
    } else if (event.target.value == "Winter") {
      this.titleTarget.innerText = "❄️ ~ Winter Veggies ~ ❄️"
      this.hideSeasonTargets
      this.winterTarget.classList.remove("d-none")
    } else if (event.target.value == "Spring") {
      this.titleTarget.innerText = "🌷 ~ Spring Veggies ~ 🌷"
      this.hideSeasonTargets
      this.springTarget.classList.remove("d-none")
    }
  }

  hideSeasonTargets() {
    this.summerTarget.classList.add("d-none")
    this.autumnTarget.classList.add("d-none")
    this.winterTarget.classList.add("d-none")
    this.springTarget.classList.add("d-none")
  }
}
