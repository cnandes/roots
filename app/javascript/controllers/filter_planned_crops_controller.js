import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter-planned-crops"
export default class extends Controller {
  static targets = ["season", "crop"]
  connect() {
    hideAll(cropTargets)
  };

  filterBySeason(event) {
    hideAll(cropTargets)
    let season = this.seasonTarget.value;
    console.log(season)
    this.cropTargets.forEach((target) => {
      console.log(target.getAttribute('value'))
      if (target.getAttribute('value') === season) {
        target.classList.remove("d-none")
      };
    });
  }

  hideAll(targets) {
    this.targets.forEach((target) => {
      target.classList.add("d-none")
    });
  }
}
