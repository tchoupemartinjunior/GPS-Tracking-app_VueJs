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
          <td>{{ lat }}, {{ lng }}</td>
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
        <tr>
          <td scope="row">Afficher sur la carte</td>
          <td></td>
          <td>
            <div class="form-check">
              <input
                class="form-check-input"
                type="checkbox"
                v-model="displayOnMap"
                id="flexCheckDefault"
              />
            </div>
          </td>
        </tr>
        <tr v-if="displayOnMap">
          <td scope="row">Afficher Trajectoire</td>
          <td></td>
          <td>
            <div class="form-check">
              <input
                class="form-check-input"
                type="checkbox"
                value=""
                id="flexCheckDefault"
              />
            </div>
          </td>
        </tr>
      </tbody>
    </table>
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
    lat: Number,
    lng: Number,
    displayedOnMap: Boolean,
    displayPath: Boolean,
  },
  data() {
    return {
      displayOnMap: this.displayedOnMap,
    };
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
