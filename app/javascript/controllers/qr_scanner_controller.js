import { Controller } from "@hotwired/stimulus"
import QrScanner from 'qr-scanner';

export default class extends Controller {
  static targets = ['output'];

  connect() {
    navigator.mediaDevices.getUserMedia({ video: true }).then((stream) => {
      this.qrScanner = new QrScanner(
        document.getElementById('camera'),
        result => {
          this.outputTarget.insertAdjacentHTML("beforeend", `<% @content = result %>`);
          this.disconnect();
        });
      this.qrScanner.start();
    }).catch((error) => {
      console.error('Error accessing camera', error);
    });
  }

  disconnect() {
    this.qrScanner.stop();
  }
}
