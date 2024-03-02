import { Controller } from "@hotwired/stimulus";
import consumer from "channels/consumer";

// Connects to data-controller="controller-kebab-case"
export default class extends Controller {
  connect() {
    // DeleteThis - grab potential params or other data from the html element that invokes
    // this stimulus controller
    this.someValue = this.element.dataset.someData
    this.createActionCableSubscription();
    // DeleteThis - if the above works, then delete all these notes below from the mapping .dotfiles mappings
    // DeleteThis - if the above doesn't work (I'm not sure if we can set this.someValue and it work inside
    // the createActionCableSubscription below), then try passing arguments instead and update the
    // createActionCableSubscription to include arguments instead of just () AND also update the .dotfiles template
    // in the dotfiles repository: templates/javascript/stimulus/base.js
    // const someValue = this.element.dataset.someData
    // this.createActionCableSubscription(someValue);
  }

  createActionCableSubscription() {
    return consumer.subscriptions.create({channel: "ControllerPascalCase", some_param: this.someValue}, {
      // Called when the subscription is ready for use on the server
      connected() {
      },

      // Called when the subscription has been terminated by the server
      disconnected() {
      },

      // Called when there's incoming data on the websocket for this channel
      received(data) {
      },
    });
  }
}
