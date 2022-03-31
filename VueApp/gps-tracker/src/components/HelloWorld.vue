<template>
  <div class="container">
    <div class="row">
      <div class="col-3 bg-dark" id="map-nav">
        <div class="search-section">
          <h3 class="text-light m-2">Véhicules</h3>
          <div class="input-group mb-3">
            <label class="input-group-text" for="vehicle-list-choice">Recherche</label>
            <input
              list="vehicle-list"
              class="form-control"
              id="vehicle-list-choice"
              name="vehicle-list-choice"
            />
            <datalist id="vehicle-list">
              <option selected>Véhicule 1</option>
              <option value="Véhicule 2"></option>
              <option value="Chauffeur 1"></option>
              <option value="Chauffeur 2"></option>
            </datalist>
          </div>
          <p>
            <a
              class="btn btn-dark"
              data-bs-toggle="collapse"
              href="#collapseExample"
              role="button"
              aria-expanded="false"
              aria-controls="collapseExample"
            >
              en ligne
            </a>
            <a
              class="btn btn-dark"
              data-bs-toggle="collapse"
              href="#collapseExample"
              role="button"
              aria-expanded="false"
              aria-controls="collapseExample"
            >
              hors ligne
            </a>
          </p>
          <div class="collapse" id="collapseExample">
            <div class="card card-body bg-dark text-white">
              <div class="list-group bg-dark text-white">
                <button
                  type="button"
                  class="list-group-item list-group-item-action active bg-dark text-white"
                  aria-current="true"
                >
                  The current button
                </button>
                <button
                  type="button"
                  class="list-group-item list-group-item-action bg-dark text-white bd-light"
                >
                  véhicule 1
                </button>
                <button
                  type="button"
                  class="list-group-item list-group-item-action bg-dark text-white bd-light"
                >
                  véhicule 2
                </button>
                <button
                  type="button"
                  class="list-group-item list-group-item-action bg-dark text-white bd-light"
                >
                  véhicule 3
                </button>
              </div>
            </div>
          </div>
        </div>
        <MapNav
          nomChauffeur="Ayokunle"
          distParcourue="120000"
          vitesseMoy="80"
          etatMoteur="Allumé"
        >
        </MapNav>
        <button class="btn btn-success">test</button>
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
  name: "HelloWorld",
  components: {
    MapNav,
    MapDisplay,
  },
  props: {},
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
