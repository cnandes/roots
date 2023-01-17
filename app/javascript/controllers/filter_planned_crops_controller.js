import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-planned-crops"
export default class extends Controller {
  static targets = ["crops", "season"]
  connect() {
    console.log("planned crops controller")
  }

  filterBySeason(event) {
    this.cropsTargets.forEach((target) => {
      target.classList.add("invisible")
    });
    let season = this.seasonTarget.value;
    this.cropsTargets.forEach((target) => {
      if (target.getAttribute('value') === season) {
        console.log(target.getAttribute('value'));
        target.classList.remove("invisible")
      };
    });
  }
}
