import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["season", "crop"]

  connect() {
    this.hideAll(this.cropTargets);
  };

  filterBySeason(event) {
    this.hideAll(this.cropTargets);
    let season = this.seasonTarget.value;
    this.cropTargets.forEach((target) => {
      if (target.getAttribute('value') === season) {
        target.classList.remove("d-none")
      };
    });
  }

  hideAll(targets) {
    targets.forEach((target) => {
      target.classList.add("d-none")
    });
  }
}
