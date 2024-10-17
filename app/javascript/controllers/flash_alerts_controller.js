import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-alerts"
export default class extends Controller {
  connect() {
    this.closeAlert()
  }

  closeAlert() {
    setTimeout(() => {
      this.element.classList.remove('opacity-100', 'max-h-full');
      this.element.classList.add('opacity-0', 'max-h-0');
      this.hideAlert()
    }, 5000)
  }

  hideAlert() {
    setTimeout(() => {
      this.element.classList.add('hidden');
    }, 300)
  }
}
