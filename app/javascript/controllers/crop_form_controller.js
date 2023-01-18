import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["date", "summer", "autumn", "winter", "spring", "titleSummer", "titleAutumn", "titleWinter", "titleSpring"]

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

  hideSeasonTargets() {
    this.summerTarget.classList.add("d-none")
    this.autumnTarget.classList.add("d-none")
    this.winterTarget.classList.add("d-none")
    this.springTarget.classList.add("d-none")
  }

  seasonSelected(event) {
    this.hideSeasonTargets()

    if (event.target.value == "Summer") {
      this.titleSummerTarget.innerHTML = "🌻 ~ Summer Veggies ~ 🌻"
      this.summerTarget.classList.remove("d-none")
    }
    else if (event.target.value == "Autumn") {
      this.titleAutumnTarget.innerHTML = "🍁 ~ Autumn Veggies ~ 🍁"
      this.autumnTarget.classList.remove("d-none")
    }
    else if (event.target.value == "Winter") {
      this.titleWinterTarget.innerHTML = "❄️ ~ Winter Veggies ~ ❄️"
      this.winterTarget.classList.remove("d-none")
    }
    else if (event.target.value == "Spring") {
      this.titleSpringTarget.innerHTML = "🌷 ~ Spring Veggies ~ 🌷"
      this.springTarget.classList.remove("d-none")
    }
  }
}
