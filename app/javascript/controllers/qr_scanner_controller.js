import { Controller } from "@hotwired/stimulus"
import QrScanner from 'qr-scanner';

export default class extends Controller {
  static targets = ['output']
  static values = { shop: String, stampcardtemplate: String }

  connect() {
    console.log(this.shopValue);
    console.log(this.stampcardtemplateValue);
    navigator.mediaDevices.getUserMedia({ video: true }).then((stream) => {
      this.qrScanner = new QrScanner(
        document.getElementById('camera'),
        result => {
          // window.location.href = `http://localhost:3000/shops/${this.shopValue}/stamp_card_templates/${this.stampcardtemplatestampCardTemplateValue}/stamp_cards/new`;
          fetch(`/shops/${this.shopValue}/stamp_card_templates/${this.stampcardtemplateValue}/stamp_cards`, {
            method: "POST",
            headers: { "Accept": "text/plain", "X-CSRF-Token": this.csrfToken },
            body: result
          })
            .then(response => response.text())
            .then((data) => {
              console.log(data)
            })
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
