<template>
  <GoogleMap
    :api-key="GOOGLE_MAPS_API_KEY"
    style="width: 100%; height: 600px"
    :center="center"
    :zoom="15"
    id="map"
  >
    <Marker
      v-for="vehicle in onlineVehicles"
      :key="vehicle.id"
      :options="{
        position: vehicle.position,
        icon: carIcon,
      }"
    >
      <InfoWindow :options="{ position: center, content: 'Hello World!' }">
        <h6>{{ vehicle.chauffeur }}</h6>
        <img src="" />
      </InfoWindow>
    </Marker>
  </GoogleMap>
</template>

<script>
import { GoogleMap, Marker, InfoWindow } from "vue3-google-map";
import { defineComponent } from "vue";
import { faCar } from "@fortawesome/free-solid-svg-icons";

import axios from "axios";

let api = "http://localhost:8080/gpsTest/position.php?action=read";
export default defineComponent({
  components: { GoogleMap, Marker, InfoWindow },
  setup() {
    const center = { lat: 48.019023, lng: 0.15784 };
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
      allVehicles: [
        {
          id: 1,
          online:true
          chauffeur: "Ayokunle",
          position: { lat: 48.013152415689454, lng: 0.16178821161615078 },
        },
        {
          id: 2,
          online:true
          chauffeur: "Imane",
          position: { lat: 48.019023, lng: 0.15784 },
        },
      ],
      markerDisplayed: false,
      GOOGLE_MAPS_API_KEY: "AIzaSyCd1a9K3CrBCgERlSjWTpIfhTx4_EEWX5I",
    };
  },
  methods: {
    mounted() {
      this.getPosition();
    },
    getOnlineVéhicule(){
      foreach
    }
    showMarker() {
      if (this.markerDisplayed == false) this.markerDisplayed = true;
      else this.markerDisplayed = false;
      console.log("hello");
    },
    getPosition() {
      axios.get(api).then((response) => {
        console.log(response);
        console.log("hello");
      });
    },
  },
});
</script>
<style scoped lang="scss">
#map {
  margin-top: 10px;
}
</style>
