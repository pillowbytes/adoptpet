import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "controls"]

  connect() {
    this.currentIndex = 0
    this.total = this.itemTargets.length

    // Hide controls if there is only one image.
    if (this.total < 2 && this.hasControlsTarget) {
      this.controlsTarget.style.display = "none"
    }

    this.showCurrent()
  }

  showCurrent() {
    // Hide all items and then show the current one.
    this.itemTargets.forEach((element, index) => {
      element.classList.toggle("active", index === this.currentIndex)
    })
  }

  next() {
    this.currentIndex = (this.currentIndex + 1) % this.total
    this.showCurrent()
  }

  previous() {
    this.currentIndex = (this.currentIndex - 1 + this.total) % this.total
    this.showCurrent()
  }
}
