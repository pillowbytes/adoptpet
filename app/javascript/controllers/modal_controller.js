import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modalBody"];

  connect() {
    console.log("Modal controller connected!");
  }

  open(event) {
    event.preventDefault();
    console.log("Modal open triggered!");

    window.scrollTo(0, 0);
    const url = event.currentTarget.dataset.modalUrl;

    fetch(url, { headers: { Accept: "text/html" } })
      .then(response => response.text())
      .then(html => {
        this.modalBodyTarget.innerHTML = html;
        document.getElementById("modal").style.display = "block";
        document.body.style.overflow = "hidden";
      })
      .catch(error => console.error("Error loading modal content:", error));
  }

  close(event) {
    event.preventDefault();
    document.getElementById("modal").style.display = "none";
    this.modalBodyTarget.innerHTML = "";
    document.body.style.overflow = "";
  }
}
