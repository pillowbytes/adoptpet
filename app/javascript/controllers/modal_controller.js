import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modalBody"];

  connect() {
    console.log("Modal controller connected!");
  }

  open(event) {
    event.preventDefault();
    console.log("Open triggered!");

    window.scrollTo(0, 0);

    const url = event.currentTarget.dataset.modalUrl;

    fetch(url, {
      headers: { "Accept": "text/vnd.turbo-stream.html" }
    })
      .then(response => response.text())
      .then(html => {
        // Insert the partial into our modal body
        this.modalBodyTarget.innerHTML = html;

        // Show the modal overlay
        document.getElementById("modal").style.display = "block";

        // Disable scrolling on the main page
        document.body.style.overflow = "hidden";
      })
      .catch(error => console.error("Error loading modal content:", error));
  }

  close(event) {
    event.preventDefault();
    console.log("Close triggered!");

    // Hide the modal overlay
    document.getElementById("modal").style.display = "none";

    // Clear the inserted partial
    this.modalBodyTarget.innerHTML = "";

    // Re-enable scrolling on the main page
    document.body.style.overflow = "";
  }
}
