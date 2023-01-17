import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-planned-crops"
export default class extends Controller {
  static targets = ["crops", "season"]
  connect() {
    console.log("planned crops controller")
  }

  filterBySeason(event) {
    let season = this.seasonTarget.value;
    console.log(season)
  }
}
