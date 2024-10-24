import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="actions-link"
export default class extends Controller {

  // Used to prevent menu dropdown from using link path '#' if we don't provide one.
  prevent(event) {
    event.preventDefault()
  }
}
