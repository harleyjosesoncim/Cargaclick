import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  static targets = ["list"];

  connect() {
    this.sortable = Sortable.create(this.listTarget, {
      animation: 150,
      onEnd: () => this._reorder()
    });
  }

  addWaypoint() {
    const address = prompt("Digite o endereço do novo ponto:");
    if (address) {
      const li = document.createElement("li");
      li.textContent = address;
      li.classList.add("bg-gray-100", "p-2", "rounded");
      this.listTarget.appendChild(li);
      this._updateRoute();
    }
  }

  _reorder() {
    this._updateRoute();
  }

  _updateRoute() {
    const waypoints = Array.from(this.listTarget.children).map(li => li.textContent);
    const event = new CustomEvent("route:updated", { detail: { waypoints } });
    window.dispatchEvent(event);
  }
}
