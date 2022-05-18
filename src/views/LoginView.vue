<template>
  <div class="container">
    <div class="row">
      <div class="col-md-6 offset-md-3">
        <h2 class="text-center text-dark mt-5">Connexion</h2>
        <div class="card my-5">
          <form class="card-body cardbody-color p-lg-5">
            <div class="text-center">
              <img
                src="https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.favpng.com%2F18%2F0%2F0%2Flogo-royalty-free-illustration-png-favpng-MU1TCAnY2juV9JmZciBdsRCdV.jpg&imgrefurl=https%3A%2F%2Ffavpng.com%2Fpng_view%2Fvector-simple-logo-design-companies-logo-royalty-free-illustration-png%2FDGdYAQYc&tbnid=wLk54YT6dTgJmM&vet=12ahUKEwiShuPQ0dn3AhWkXvEDHfToAhkQMygnegUIARCSAg..i&docid=VS6YXuZbfB9WNM&w=820&h=820&q=free%20logo%20png&ved=2ahUKEwiShuPQ0dn3AhWkXvEDHfToAhkQMygnegUIARCSAg"
                class="img-fluid profile-image-pic img-thumbnail rounded-circle my-3"
                width="200px"
                alt="profile"
              />
            </div>

            <div class="mb-3">
              <label class="fs-4">Identifiant</label>
              <input
                type="text"
                class="form-control"
                id="Username"
                aria-describedby="emailHelp"
                placeholder="Identifiant"
              />
            </div>
            <label class="fs-4">Mot de passe</label>
            <div class="mb-3">
              <input
                type="password"
                class="form-control"
                id="password"
                placeholder="mot de passe"
              />
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-color px-5 mb-5 w-100 fs-3 bg-dark">
                Se connecter
              </button>
            </div>
            <div id="emailHelp" class="form-text text-center mb-5 text-dark">
              pas de compte?
              <a href="#" class="text-dark fw-bold fs-5"> Créez un compte</a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src

export default {
  name: "LoginView",
};
</script>
<style scoped lang="scss">
.btn-color {
  background-color: #0e1c36;
  color: #fff;
}

.profile-image-pic {
  height: 200px;
  width: 200px;
  object-fit: cover;
}

.cardbody-color {
  background-color: #ebf2fa;
}

a {
  text-decoration: none;
}
</style>
