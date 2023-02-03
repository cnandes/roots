import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="weather"
export default class extends Controller {
  static targets = ["temp", "icon"]
  static values = {
    apiKey: String,
  }

  connect() {
    console.log("weather controller :)");
    fetch(`https://api.openweathermap.org/data/2.5/weather?lat=-37.81271616112838&lon=144.95845581892425&appid=${this.apiKeyValue}`)
      .then(response => response.json())
      .then(data => this.displayWeatherData(data));
  }

  displayWeatherData(data) {
    console.log(data);
    console.log(data.weather[0].main)
    console.log(Math.round((data.main.temp - 273.15)))
    this.tempTarget.innerHTML = `${Math.round((data.main.temp - 273.15))}°C`;
    // let date = new Date(Date.now() + data.timezone * 1000);
    // date = date.toUTCString();
    // const iconId = data.weather[0].icon;
    // this.displayTarget.innerHTML = `${data.name}`;
    // this.iconTarget.src = `https://openweathermap.org/img/w/${iconId}.png`;
    // this.dateTarget.innerHTML = `${date}`;
  }
}
