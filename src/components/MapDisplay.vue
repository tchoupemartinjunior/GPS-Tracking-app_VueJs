<template>
  <GoogleMap
    :api-key="GOOGLE_MAPS_API_KEY"
    style="width: 100%; height: 100%"
    :center="center"
    :zoom="15"
    id="map"
  >
    <Marker
      v-for="vehicle in allCurrentVehicles"
      :key="vehicle.idVehicule"
      :options="{
        position: vehicle.position,

        icon: carIcon,
      }"
      @click="showInfoWindow = true"
    >
      <Polyline v-if="afficherTrajet" :options="carPath" />

      <InfoWindow
        v-if="showInfoWindow"
        :options="{ position: center, content: 'Hello World!' }"
      >
        <div class="form-check">
          <input
            class="form-check-input"
            type="checkbox"
            v-model="afficherTrajet"
            id="flexCheckDefault"
          />
          <label for="flexCheckDefault" class="text-left">Trajectoire</label>
        </div>
        <h6>{{ vehicle.nomChauffeur }}</h6>

        <p>online: {{ vehicle.online }}</p>

        <img src="" />
      </InfoWindow>
    </Marker>
  </GoogleMap>
</template>

<script>
import { GoogleMap, Marker, InfoWindow, Polyline } from "vue3-google-map";
import { defineComponent } from "vue";
import { faCar } from "@fortawesome/free-solid-svg-icons";

const api = "http://localhost:3000/api/vehicules";
export default defineComponent({
  components: { GoogleMap, Marker, InfoWindow, Polyline },

  setup() {
    // la zone sur laquelle  la map est centré
    const center = { lat: 48.019023, lng: 0.15784 };
    // parametres de l'icone voiture
    const carIcon = {
      path: faCar.icon[4],
      fillColor: "#000000",
      fillOpacity: 1,
      strokeWeight: 1,
      strokeColor: "#ffffff",
      scale: 0.065,
    };
    // tracé du chemin des véhicules

    return { center, carIcon };
  },
  /*computed: {
    allVehicles: function () {
      return this.fetchResult();
    },
  },
*/
  data() {
    return {
      index: 0,
      onlineVehicles: [],
      allCurrentVehicles: [],
      afficherTrajet: false,
      //markerDisplayed: false,
      GOOGLE_MAPS_API_KEY: "AIzaSyCd1a9K3CrBCgERlSjWTpIfhTx4_EEWX5I",
      showInfoWindow: false,

      allVehicles: [],

      carCoordinatesTest: [{ lat: 48.019023, lng: 0.15784 }],
      carCoordinates: [],
      carPath: {
        path: this.carCoordinates,
        geodesic: true,
        strokeColor: "#000000",
        strokeOpacity: 1.0,
        strokeWeight: 4,
      },
    };
  },
  mounted() {
    this.fetchResult();
    //this.getCurrentPosition();
    //setInterval(this.updateMap, 5000);
    this.timer = setInterval(this.fetchResult, 10000);
    if (this.afficherTrajet) {
      this.timer2 = setInterval(this.updateMap, 60000);
    }
  },

  methods: {
    async sendGetRequest() {
      try {
        const resp = await this.axios.get(api);
        //console.log(resp.data);
        return resp.data;
      } catch (err) {
        // Handle Error Here
        console.error(err);
      }
    },
    async fetchResult() {
      let success = await this.sendGetRequest();
      if (success) {
        // all vehicles
        this.allVehicles = success.data;
        // the last position of the vehicules
        this.allCurrentVehicles = [];

        // get last position of each car

        this.allCurrentVehicles.push(success.data[success.data.length - 1]);
        var tempcoord = this.allVehicles.map((coord) => {
          return coord.position;
        });

        this.carCoordinates = [];

        this.carCoordinates.push(tempcoord);

        this.carPath.path = this.carCoordinates[0];

        console.log(this.carCoordinates[0]);
        console.log(this.carPath.path);
        //console.log(this.allCurrentVehicles);
        //return success.data;
      } else {
        // handle error
        // #
      }
    },
    getOnlineVehicule() {},

    getCurrentPosition() {},
    updateMap() {},

    drawCarPath() {},
  },
});
</script>
<style scoped lang="scss">
#map {
  margin-top: 10px;
}
</style>
