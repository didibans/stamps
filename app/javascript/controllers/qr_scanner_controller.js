import { Controller } from "@hotwired/stimulus"
import QrScanner from 'qr-scanner';

export default class extends Controller {
  static targets = ['output']
  static values = { shop: String, stampcardtemplate: String }

  connect() {
    console.log("hallo");
    navigator.mediaDevices.getUserMedia({ video: true }).then((stream) => {
      this.qrScanner = new QrScanner(
        document.getElementById('camera'),
        result => {
          window.location.href = `${result}`;
          this.disconnect();
        });
      this.qrScanner.start();
    }).catch((error) => {
      console.error('Error accessing camera', error);
    });
  }

  disconnect() {
    this.qrScanner.stop();
    console.log("logged out");
  }
}
