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
          <label for="flexCheckDefault" class="text-left">Trajet</label>
        </div>
        <h5>{{ vehicle.nomChauffeur }}</h5>
        <h6>Date: {{ vehicle.dateHeure }}</h6>
        <h6>Dist. parcourue: {{ vehicle.distParcourue }} km</h6>
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
    return { center, carIcon };
  },

  data() {
    return {
      index: 0,
      allCurrentVehicles: [],
      afficherTrajet: false,
      GOOGLE_MAPS_API_KEY: process.env.GOOGLE_MAPS_API_KEY,
      showInfoWindow: false,
      allVehicles: [],
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
    this.timer = setInterval(this.fetchResult, 10000);
    //this.timer2 = setInterval(this.updateMap, 15000);
  },

  methods: {
    async sendGetRequest() {
      try {
        const resp = await this.axios.get(api);
        return resp.data;
      } catch (err) {
        console.error(err);
      }
    },
    async fetchResult() {
      let success = await this.sendGetRequest();
      if (success) {
        // all vehicles
        this.allVehicles = success.data;
        console.log(success.data);
        // store all position into an array in order to caalculate the total distance covered by the car
        var allPositions = success.data.map((pos) => {
          return pos.position;
        });
        console.log(allPositions);
        // the last position of the vehicules
        this.allCurrentVehicles = [];

        // get last position of each car

        this.allCurrentVehicles.push(success.data[success.data.length - 1]);
        this.allCurrentVehicles.forEach((veh) => {
          // calcul de la distance parcouru depuis la premiere position jusqua la position actuelle
          veh["distParcourue"] = this.calcDistParcourue(allPositions).toFixed(2);
          console.log(veh);
        });
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

    //This function takes in latitude and longitude of two location and returns the distance between them as the crow flies (in km)
    calcCrow(lat1, lon1, lat2, lon2) {
      var R = 6371; // km
      var dLat = this.toRad(lat2 - lat1);
      var dLon = this.toRad(lon2 - lon1);
      lat1 = this.toRad(lat1);
      lat2 = this.toRad(lat2);

      var a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
      var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      var d = R * c;
      console.log(d);
      return d;
    },

    // Converts numeric degrees to radians
    toRad(Value) {
      return (Value * Math.PI) / 180;
    },

    calcDistParcourue(tab) {
      var distParcourue = 0;
      for (var i = 0; i < tab.length; i++) {
        if (i == tab.length - 1) {
          return distParcourue;
        } else {
          distParcourue += this.calcCrow(
            tab[i].lat,
            tab[i].lng,
            tab[i + 1].lat,
            tab[i + 1].lng
          );
        }
      }
    },
  },
});
</script>
<style scoped lang="scss">
#map {
  margin-top: 10px;
}
</style>
