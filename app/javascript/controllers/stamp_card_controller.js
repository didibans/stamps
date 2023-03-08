import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stamp-card"
export default class extends Controller {
  connect() {
    console.log()
  }
  switchToBack() {
    this.element.classList.add("switch")
  }

  switchToFront() {
    this.element.classList.remove("switch")
  }
}
