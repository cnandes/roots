import { Controller } from "@hotwired/stimulus"
import { Turbo } from "@hotwired/turbo-rails"

export default class extends Controller {
  connect() {
    this.element.addEventListener('turbo:submit-end', (event) => {
      Turbo.cache.clear()
      if (event.detail.success) {
        const redirectUrl = event.detail.fetchResponse.response.url
        Turbo.visit(redirectUrl)
      }
    })
  }
}
