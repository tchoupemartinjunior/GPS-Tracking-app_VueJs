<template>
  <div class="container">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container">
        <a class="navbar-brand" href="#">LOGO</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <!-- menu item 1 -->
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="/"
                ><i class="fa-solid fa-map-location fa-2x"></i><br />

                <router-link to="/"> Carte en direct</router-link></a
              >
            </li>

            <!-- menu item 2 -->
            <li class="nav-item">
              <a class="nav-link" aria-current="page" href="/dashboard"
                ><i class="fa-solid fa-chart-line fa-2x"></i><br />

                <router-link to="/dashboard">Tableau de bord</router-link></a
              >
            </li>

            <!-- menu item 3 -->
            <li class="nav-item">
              <a class="nav-link" aria-current="page"
                ><i class="fa-solid fa-user-gear fa-2x"></i><br />

                <router-link to="/administration">Administration</router-link></a
              >
            </li>
            <!-- menu item 4 -->
            <li class="nav-item">
              <a class="nav-link" aria-current="page"
                ><i class="fa-solid fa-arrow-rotate-left fa-2x"></i><br />
                <router-link to="/home">Replay</router-link></a
              >
            </li>
          </ul>
          <div class="dropdown">
            <button
              class="btn btn-outline-light"
              id="dropdownMenuButton1"
              data-bs-toggle="dropdown"
              aria-expanded="false"
            >
              <i class="fa-solid fa-gear fa-2x"></i>
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
              <li>
                <a class="dropdown-item text-dark">
                  <router-link to="/profile">
                    <i class="fa-solid fa-user"></i>Profil
                  </router-link></a
                >
              </li>
              <li>
                <a class="dropdown-item" href="#"
                  ><router-link to="/login">
                    <i class="fa-solid fa-right-from-bracket"></i> Se
                    déconnecter</router-link
                  ></a
                >
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </div>
        </div>
      </div>
    </nav>
  </div>
  <router-view />
  <BarChart />
</template>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
}
.svg-inline--fa {
  color: white;
}
.navbar {
  margin-top: 20px;
  height: 90px;
}

nav {
  padding: 30px;

  a {
    font-size: 16px;
    font-weight: bold;
    color: white;
    text-decoration: none;
  }
  .nav-item {
    margin-right: 20px;
    margin-top: 10px;
  }
  .nav-item:hover {
    .svg-inline--fa {
      color: orange;
    }
    a {
      color: orange;
    }
  }

  .router-link-exact-active {
    color: orange;

    li.nav-item {
      color: orange;
    }
  }
  .me-auto {
    margin-left: 300px;
  }
  a.dropdown #text {
    color: black;
  }
}
button.btn.btn-outline-light:hover {
  color: orange;
  background-color: black;
  border-color: orange;
}
.dropdown-menu .svg-inline--fa {
  color: black;
}
</style>
