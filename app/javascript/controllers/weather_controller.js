import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temp", "icon"]
  static values = {
    apiKey: String,
  }

  connect() {
    fetch(`https://api.openweathermap.org/data/2.5/weather?lat=-37.81271616112838&lon=144.95845581892425&appid=${this.apiKeyValue}`)
      .then(response => response.json())
      .then(data => this.displayWeatherData(data));
  }

  displayWeatherData(data) {
    // console.log(data);
    this.tempTarget.innerHTML = `<h4>${Math.round((data.main.temp - 273.15))}</h4><h6>°C</h6>`;
    // complete on another branch, will update background image of avatar nav icon
    // this.iconTarget.classList.add(data.weather[0].main)
  }
}
