import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-alerts"
export default class extends Controller {
  connect() {
    this.closeAlert()
  }

  closeAlert() {
    setTimeout(() => {
      this.element.classList.add('hidden')
    }, 5000)
  }
}
