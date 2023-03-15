import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar-hide-scrolldown"
export default class extends Controller {

  static targets = ["navbar"]

  updateNavbar() {
    const currentScrollPos = window.scrollY
    if (!this.prevScrollPos || this.prevScrollPos < currentScrollPos ) {
      this.navbarTarget.classList.add("navbar-hidden")
    } else {
      this.navbarTarget.classList.remove("navbar-hidden")
    }
    this.prevScrollPos = currentScrollPos
    }
}
