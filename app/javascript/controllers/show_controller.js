import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show"
export default class extends Controller {
  static targets = ["input", "quantity", "price", "price_total"]
  static values = {
    price: Number
  }
  connect() {
    // console.log("hello from show controller")
  }
  minus(event) {
    event.preventDefault()
    let value = this.inputTarget.value
    value--
    if (value > 0) {
      this.inputTarget.value = value
      this.quantityTarget.textContent = `${value}x`
      this.priceTarget.textContent = `$${ value * this.priceValue}.0`
      this.price_totalTarget.textContent = `$${ value * this.priceValue}.0`
    }
  }
  add(event) {
    event.preventDefault()
    let stock = parseInt(document.getElementById("stock").textContent)
    let value = this.inputTarget.value
    if (stock > value) {
      value++
      this.inputTarget.value = value
      this.quantityTarget.textContent = `${value}x`
      this.priceTarget.textContent = `$${ value * this.priceValue}.0`
      this.price_totalTarget.textContent = `$${ value * this.priceValue}.0`
      // console.log(this.priceValue)
    }
  }
}
