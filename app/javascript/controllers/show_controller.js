import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
  static targets = ["input"]
  connect() {
    // console.log("hello from show controller")
  }
  minus(event) {
    event.preventDefault()
    let value = this.inputTarget.innerText
    value = parseInt(value) - 1
    if (value > 0) {
      this.inputTarget.innerText = value
    }
    // console.log( this.inputTarget.innerText)
  }
  add(event) {
    event.preventDefault()
    let stock = parseInt(document.getElementById("stock").textContent)
    let value = this.inputTarget.innerText
    if (stock > value) {
      value = parseInt(value) + 1
      this.inputTarget.innerText = value
    }
  }
}
