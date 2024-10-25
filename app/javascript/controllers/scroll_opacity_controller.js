import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    this._boundScrollHandler = this.throttle(this.handleScroll.bind(this), 100)
    window.addEventListener('scroll', this._boundScrollHandler, { passive: true })
  }

  disconnect() {
    window.removeEventListener('scroll', this._boundScrollHandler)
    if (this.scrollTimeout) {
      clearTimeout(this.scrollTimeout)
    }
  }

  throttle(func, limit) {
    let inThrottle
    return function(...args) {
      if (!inThrottle) {
        func.apply(this, args)
        inThrottle = true
        setTimeout(() => inThrottle = false, limit)
      }
    }
  }

  handleScroll() {
    if (this.scrollTimeout) {
      clearTimeout(this.scrollTimeout)
    }

    requestAnimationFrame(() => {
      this.element.classList.add('opacity-40')
      this.element.classList.remove('opacity-100')
    })

    this.scrollTimeout = setTimeout(() => {
      requestAnimationFrame(() => {
        this.element.classList.remove('opacity-40')
        this.element.classList.add('opacity-100')
      })
    }, 1000)
  }
}
