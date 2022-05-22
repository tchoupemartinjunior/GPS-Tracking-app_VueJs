<template>
  <div class="container">
    <div class="row">
      <div class="col-3 bg-dark" id="map-nav">
        <div class="search-section">
          <h3 class="text-light m-2">Véhicules</h3>
          <div class="input-group mb-3">
            <label class="input-group-text" for="vehicle-list-choice">Recherche</label>

            <datalist id="vehicle-list">
              <option
                v-for="vehicle in allVehicles"
                :key="vehicle.id"
                :value="vehicle.chauffeur"
              ></option>
            </datalist>
            <input
              @keyup.enter="getCurrentVehicle(searchKeyword)"
              list="vehicle-list"
              class="form-control"
              id="vehicle-list-choice"
              name="vehicle-list-choice"
              v-model="searchKeyword"
            />
          </div>
          <p>
            <a
              class="btn bd-success btn-dark"
              data-bs-toggle="collapse"
              href="#onlineVehicle"
              role="button"
              aria-expanded="false"
              aria-controls="onlineVehicle"
            >
              En ligne
              <span class="badge bg-secondary">{{ nbOnline }}</span>
            </a>
            <a
              class="btn btn-outline btn-dark"
              data-bs-toggle="collapse"
              href="#offlineVehicle"
              role="button"
              aria-expanded="false"
              aria-controls="offlineVehicle"
            >
              Hors ligne
              <span class="badge bg-secondary">{{ nbOffline }}</span>
            </a>
          </p>
          <div class="collapse" id="onlineVehicle">
            <div class="card card-body bg-dark text-white">
              <h5 class="text-left bg-success">Online</h5>
              <a
                href="#"
                @click="getCurrentVehicle(vehicle.id)"
                class="list-group-item list-group-item-action bg-dark text-white"
                v-for="vehicle in onlineVehicles"
                :key="vehicle.id"
              >
                {{ vehicle.chauffeur }}
              </a>
            </div>
          </div>

          <div class="collapse" id="offlineVehicle">
            <div class="card card-body bg-dark text-white">
              <h5 class="text-left bg-warning text-black">Offline</h5>
              <a
                href="#"
                @click="getCurrentVehicle(vehicle.id)"
                class="list-group-item list-group-item-action bg-dark text-white"
                v-for="vehicle in offlineVehicles"
                :key="vehicle.id"
              >
                {{ vehicle.chauffeur }}
              </a>
            </div>
          </div>
        </div>
        <MapNav
          v-model="carState"
          :nomChauffeur="carState.nomChauffeur"
          :distParcourue="carState.distParcourue"
          :lat="carState.lat"
          :lng="carState.lng"
          vitesseMoy="80"
          etatMoteur="Allumé"
        >
        </MapNav>
      </div>
      <div class="col-9 float-right">
        <MapDisplay />
      </div>
    </div>
  </div>
</template>

<script>
import MapNav from "@/components/MapNav.vue";
import MapDisplay from "@/components/MapDisplay.vue";

export default {
  name: "HomePage",

  components: {
    MapNav,
    MapDisplay,
  },
  props: {},
  computed: {
    allVehicles: function () {
      return this.$store.state.allVehicles;
    },
  },
  data() {
    return {
      onlineVehicles: [],
      offlineVehicles: [],
      nbOnline: null,
      nbOffline: null,
      currentVehicle: new Object(),
      carState: {
        nomChauffeur: "ayokunle",
        distParcourue: "120000",
        vitesseMoy: "80",
        etatMoteur: "Allumé",
      },
      searchKeyword: null,
    };
  },

  mounted() {
    this.getOnlineVehicle();
    this.getOfflineVehicle();
  },

  methods: {
    getOnlineVehicle() {
      this.allVehicles.forEach((vehicle) => {
        if (vehicle.online) {
          this.onlineVehicles.push(vehicle);
          // console.log(vehicle);
        }
      });
      this.nbOnline = this.onlineVehicles.length;
    },

    getOfflineVehicle() {
      this.allVehicles.forEach((vehicle) => {
        if (vehicle.online == false) {
          this.offlineVehicles.push(vehicle);
          //console.log(vehicle);
        }
      });
      this.nbOffline = this.offlineVehicles.length;
    },

    getCurrentVehicle(id) {
      this.allVehicles.forEach((vehicle) => {
        if (vehicle.id == id) {
          this.currentVehicle = vehicle;
          console.log(this.currentVehicle);
          this.searchKeyword = vehicle.chauffeur; //affichage du meme nom dans la barre de recherche
        } else if (vehicle.chauffeur == id) {
          this.currentVehicle = vehicle;
          console.log(this.currentVehicle);
          this.searchKeyword = vehicle.chauffeur;
        }
      });
      this.carState.nomChauffeur = this.currentVehicle.chauffeur;
      this.carState.distParcourue = this.currentVehicle.distParcourue;
      this.carState.vitesseMoy = this.currentVehicle.vitesseMoy;
      this.carState.etatMoteur = this.currentVehicle.etatMoteur;
      this.carState.lat = parseFloat(this.currentVehicle.position.lat).toFixed(3);
      this.carState.lng = this.currentVehicle.position.lng;
      console.log(this.carState.lat);
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
#map-nav {
  margin-top: 10px;
  margin-left: 0px;
  height: 900px;
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
a:hover {
  background-color: orange;
}
</style>
