import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  static values = { userId: Number }
  static targets = ["notification"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      { received: data => {
        // window.location.href = `/shops/${data}`;
        const myModal = new bootstrap.Modal(document.getElementById('testModal'), {})
        // setTimeout(myModal.show(), 4000)
        myModal.show()
      //   myModal.on("hide.bs.modal", (e) => {
      //     console.log("close modal");
      //     window.location.href = `/shops/${data}`;
      // });
      }}
    )
    console.log(`Subscribed to user with ${this.userIdValue}`);
  }
}

// this.notificationTarget.insertAdjacentHTML("beforeend", `<p>${data}</p>`)
