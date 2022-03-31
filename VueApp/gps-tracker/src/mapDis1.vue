<template>
  <div class="col-9 float-right">
    <div id="floating-panel">
      <input id="remove-line" class="btn btn-dark" value="Remove line" />
      <input id="add-line" class="btn btn-dark" value="Restore line" />
    </div>
    <div id="map" style="width: 100%; height: 800px"></div>
  </div>
</template>

<script>
import { Loader } from "@googlemaps/js-api-loader";
import { faCar } from "@fortawesome/free-solid-svg-icons";
let marker;
let vehicleCoordinates;
let travelPath;
/*TABLEAU QUI STOCKE LA POSITION DES VEHICULES*/
const gps = [
  { lat: 48.018, lng: 0.155191 },
  { lat: 48.019023, lng: 0.15784 },
];

const loader = new Loader({
  apiKey: "AIzaSyCd1a9K3CrBCgERlSjWTpIfhTx4_EEWX5I",
  version: "weekly",
  libraries: ["places"],
});

const mapOptions = {
  center: { lat: 48.019023, lng: 0.15784 },
  zoom: 15,
};

const contentString =
  '<div id="content">' +
  '<div id="siteNotice">' +
  "</div>" +
  '<h1 id="firstHeading" class="firstHeading">Ayokunle</h1>' +
  '<div id="bodyContent">' +
  "<p><b>Ayokunle</b>, also referred to as <b>Ayers Rock</b>, is a large " +
  "sandstone rock formation in the southern part of the " +
  "</p>" +
  "</div>" +
  "</div>";

// const iconBase ="https://developers.google.com/maps/documentation/javascript/examples/full/images/";

// Promise
loader.load().then((google) => {
  const map = new google.maps.Map(document.getElementById("map"), mapOptions);

  const infowindow = new google.maps.InfoWindow({
    content: contentString,
    maxWidth: 200,
  });

  const carIcon = {
    path: faCar.icon[4],
    fillColor: "#000000",
    fillOpacity: 1,
    anchor: new google.maps.Point(
      faCar.icon[0] / 4, // width
      faCar.icon[1] / 4 // height
    ),
    strokeWeight: 1,
    strokeColor: "#ffffff",
    scale: 0.065,
  };
  /**zone de message text qui s'affiche lorsqu'on clique sur un marqueur */
  function showCarInfo() {
    infowindow.open({
      anchor: marker,
      map,
      shouldFocus: false,
    });
  }
  /**creation de marqueurs */
  function newMapMarker(location) {
    return new google.maps.Marker({
      position: location,
      map: map,
      icon: carIcon,
    });
  }

  gps.forEach(function (pos) {
    marker = newMapMarker(pos);
  });
  marker.addListener("onclick", showCarInfo());
  console.log(marker);

  /*** Tracé de l'itinéraire */
  vehicleCoordinates = [
    { lat: 48.018, lng: 0.155191 },
    { lat: 48.01600884704869, lng: 0.1520035132047409 },
    { lat: 48.019023, lng: 0.15784 },
  ];
  travelPath = new google.maps.Polyline({
    path: vehicleCoordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  travelPath.setMap(map);

  // add event listener for click event
  document.getElementById("add-line").addEventListener("click", addLine);
  document.getElementById("remove-line").addEventListener("click", removeLine);
  // initialize with line
  addLine();

  function addLine() {
    travelPath.setMap(map);
  }

  function removeLine() {
    travelPath.setMap(null);
  }
});
export default {
  name: "MapDisplay",
};
</script>
<style scoped lang="scss">
#map {
  margin-top: 10px;
}
</style>
