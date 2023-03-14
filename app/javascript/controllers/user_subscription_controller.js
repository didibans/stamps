import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="user-subscription"
export default class extends Controller {
  static values = { userId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      { received: data => console.log(data) }
    )
    console.log(`Subscribed to user with ${this.userIdValue}`);
  }
}
