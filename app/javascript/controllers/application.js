import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers" // added to reload stimulus controller on showing of modal

const application = Application.start()
const context = require.context("controllers", true, /\.js$/) // added to reload stimulus controller on showing of modal
application.load(definitionsFromContext(context)) // added to reload stimulus controller on showing of modal

// added to reload stimulus controller on showing of modal
document.addEventListener("shown.bs.modal", function() {
  const controller = new MyController()
  controller.initialize()
});


// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
