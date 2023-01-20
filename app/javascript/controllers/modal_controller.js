import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  static targets = ['form', 'close']
  connect() {
    console.log('hello')
    console.log(this.formTarget)
    console.log(closeTarget)
    console.log('modal controller connected')
    this.formTarget.addEventListener('turbo:submit-end', (event) => {
      console.log(event)
      if (event.detail.success) {
        console.log('success')
        this.close()

      }
    })
  }

  close() {
    console.log('closing modal')
    this.closeTarget.click()
  }
}
