import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.initializeTheme()
  }

  initializeTheme() {
    document.documentElement.classList.toggle(
      'dark',
      localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)
    )
  }

  light(e) {
    e.preventDefault()
    localStorage.theme = 'light'
    document.documentElement.classList.toggle('light', true)
    document.documentElement.classList.toggle('dark', false)
  }

  dark(e) {
    e.preventDefault()
    localStorage.theme = 'dark'
    document.documentElement.classList.toggle('light', false)
    document.documentElement.classList.toggle('dark', true)
  }

  default(e) {
    e.preventDefault()
    localStorage.removeItem('theme')
    this.initializeTheme()
  }
}
