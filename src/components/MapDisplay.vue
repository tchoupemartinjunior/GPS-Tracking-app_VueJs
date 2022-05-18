<template>
  <GoogleMap
    :api-key="GOOGLE_MAPS_API_KEY"
    style="width: 100%; height: 100%"
    :center="center"
    :zoom="15"
    id="map"
  >
    <Marker
      v-for="vehicle in allVehicles"
      :key="vehicle.idChauffeur"
      :options="{
        position: vehicle.position,
        icon: carIcon,
      }"
      @click="showInfoWindow = true"
    >
      <Polyline :options="carPath" />

      <InfoWindow
        v-if="showInfoWindow"
        :options="{ position: center, content: 'Hello World!' }"
      >
        <h6>{{ vehicle.chauffeur }}</h6>
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

//let api = "http://localhost:8080/gpsTest/position.php?action=read";
export default defineComponent({
  components: { GoogleMap, Marker, InfoWindow, Polyline },

  setup() {
    // la zone sur laquelle est la map est centré
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
  computed: {
    allVehicles: function () {
      return this.$store.state.allVehicles;
    },
    /* allPositions: function () {
      console.log(this.$store.positions.allPositions);
      return this.$store.positions.allPositions;
    },*/
  },
  data() {
    return {
      index: 0,
      onlineVehicles: [],
      markerDisplayed: false,
      GOOGLE_MAPS_API_KEY: "AIzaSyCd1a9K3CrBCgERlSjWTpIfhTx4_EEWX5I",
      showInfoWindow: false,
      allPositions: [
        {
          lat: 48.019020998475504,
          lng: 0.15730695295252492,
        },
        {
          lat: 48.0182273154203,
          lng: 0.15802144618493977,
        },
        {
          lat: 48.017937148672644,
          lng: 0.15808524022354825,
        },
        {
          lat: 48.01744215456929,
          lng: 0.1581490342621567,
        },
        {
          lat: 48.01662284354167,
          lng: 0.15802144618493977,
        },
        {
          lat: 48.01548773487526,
          lng: 0.15848076326292077,
        },
        {
          lat: 48.015265831012854,
          lng: 0.16031803157484473,
        },
        {
          lat: 48.01535221483795,
          lng: 0.17763710702217328,
        },
      ],

      carCoordinates: [
        { lat: 48.01902, lng: 0.1573069 },
        { lat: 48.01822731, lng: 0.1580214 },
        { lat: 48.017937148672644, lng: 0.15808524022354825 },
        { lat: 48.01492443859049, lng: 0.1616321887701792 },
      ],
      carPath: {
        path: this.carCoordinates,
        geodesic: true,
        strokeColor: "#000000",
        strokeOpacity: 1.0,
        strokeWeight: 3,
      },
    };
  },
  mounted() {
    this.getCurrentPosition();

    //this.timer = setInterval(this.getCurrentPosition, 5000);
  },

  methods: {
    getOnlineVehicule() {
      this.allVehicles.forEach((vehicle) => {
        this.onlineVehicles.push(vehicle);
      });
    },

    getCurrentPosition() {
      this.carCoordinates = this.allPositions;
      //this.carCoordinates.push(this.allPositions[this.index]);
      this.carPath.path = this.carCoordinates;
      console.log(this.carCoordinates);
    },

    drawCarPath() {},
  },
});
</script>
<style scoped lang="scss">
#map {
  margin-top: 10px;
}
</style>
