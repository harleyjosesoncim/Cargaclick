import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["total", "base", "commission"];

  connect() {
    window.addEventListener("route:updated", event => {
      const { waypoints } = event.detail;
      this._fetchCost(waypoints);
    });
  }

  _fetchCost(waypoints) {
    fetch(`/api/cost?points=${encodeURIComponent(JSON.stringify(waypoints))}`)
      .then(response => response.json())
      .then(data => {
        this.baseTarget.textContent = `R$ ${data.base.toFixed(2)}`;
        this.commissionTarget.textContent = `R$ ${data.commission.toFixed(2)}`;
        this.totalTarget.textContent = `R$ ${data.total.toFixed(2)}`;
      })
      .catch(error => console.error("Erro ao buscar custo:", error));
  }
}
