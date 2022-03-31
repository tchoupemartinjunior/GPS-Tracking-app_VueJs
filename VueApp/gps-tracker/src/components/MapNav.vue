<template>
  <div id="vehicle-info">
    <table class="table table-dark table-hover">
      <thead>
        <tr>
          <th scope="col">Vehicule 1</th>
          <th scope="col"></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th scope="row">Chauffeur</th>
          <td></td>
          <td>{{ nomChauffeur }}</td>
          <td></td>
        </tr>
        <tr>
          <th scope="row">Position</th>
          <td></td>
          <td>dd</td>
          <td></td>
        </tr>
        <tr>
          <th scope="row">Dist. parcourue</th>
          <td></td>
          <td>{{ distParcourue }}km</td>
          <td></td>
        </tr>
        <tr>
          <th scope="row">Vitesse moy</th>
          <td></td>
          <td>{{ vitesseMoy }} kph</td>
          <td></td>
        </tr>
        <tr>
          <th scope="row">Moteur</th>
          <td></td>
          <td>{{ etatMoteur }}</td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
  <div id="floating-panel">
    <input id="add-line" class="btn btn-success" value="Afficher trajet" />
  </div>
</template>

<script>
export default {
  name: "MapNav",
  props: {
    nomChauffeur: String,
    distParcourue: Number,
    vitesseMoy: Number,
    etatMoteur: String,
    position: [],
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
#map-nav {
  margin-top: 10px;
  margin-left: 0px;
}
.active,
.btn:hover {
  background-color: orange;
  color: white;
}
a:hover {
  color: orange;
}
button:hover {
  background-color: orange;
}
</style>
