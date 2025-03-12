import { Controller } from "@hotwired/stimulus";
import AnimatedNumber from "stimulus-animated-number";

export default class extends Controller {
  static targets = ["counter"];
  static values = { count: Number };

  connect() {
    this.countValue = this.countValue || 250;
    this.updateCounter();
    this.incrementRandomly();
  }

  updateCounter() {
    this.counterTarget.textContent = this.countValue;
  }

  incrementRandomly() {
    setInterval(() => {
      this.countValue += Math.floor(Math.random() * 3) + 1; // Increase 1-3
      this.updateCounter();
    }, Math.floor(Math.random() * 5000) + 3000); // Every 3-8 seconds
  }
}
