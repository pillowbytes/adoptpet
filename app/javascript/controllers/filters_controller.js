import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["speciesField", "genderField", "sizeField", "ageRangeField"];

  applyFilter(event) {
    event.preventDefault();

    const value = event.currentTarget.dataset.value;
    const dropdown = event.currentTarget.closest(".dropdown");
    const hiddenField = dropdown.querySelector("input[type='hidden']");
    hiddenField.value = value;

    // Update the dropdown button's label to reflect the selected option
    const labelElement = dropdown.querySelector(".dropdown-label");
    // If a value is selected, use that option's text; otherwise, revert to default text stored in data-default-text
    if (labelElement) {
      const defaultText = dropdown.querySelector(".dropdown-toggle").dataset.defaultText;
      labelElement.textContent = value ? event.currentTarget.textContent : defaultText;
    }

    this.element.requestSubmit();
  }
}
