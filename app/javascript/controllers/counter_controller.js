import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["counter"];

  connect() {
    this.startingCount = this.calculateInitialCount();
    this.counterTarget.textContent = this.startingCount;
    this.incrementRandomly();
  }

  calculateInitialCount() {
    const baseNumber = 100;
    const timestamp = Math.floor(Date.now() / 1000);
    const variation = timestamp % 100;

    return baseNumber + variation;
  }

  incrementRandomly() {
    setInterval(() => {
      const increment = Math.floor(Math.random() * 3) + 1;
      this.startingCount += increment;
      this.counterTarget.textContent = this.startingCount;
    }, Math.floor(Math.random() * 5000) + 3000);
  }
}
