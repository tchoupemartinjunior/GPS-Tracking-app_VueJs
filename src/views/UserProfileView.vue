<template>
  <div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
      <div class="col-md-3 border-right">
        <div class="d-flex flex-column align-items-center text-center p-3 py-5">
          <img
            class="rounded-circle mt-5"
            width="150px"
            src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"
          /><span class="font-weight-bold">Avossevou</span
          ><span class="text-black-50">avossevou@mail.com.my</span><span> </span>
        </div>
      </div>
      <div class="col-md-5 border-right">
        <div class="p-3 py-5">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="text-right">Profile Settings</h4>
          </div>
          <div class="row mt-2">
            <div class="col-md-6">
              <label class="labels">Prénom </label
              ><input type="text" class="form-control" placeholder="prénom" value="" />
            </div>
            <div class="col-md-6">
              <label class="labels">Nom</label
              ><input type="text" class="form-control" value="" placeholder="nom" />
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-md-12">
              <label class="labels">Téléphone</label
              ><input
                type="text"
                class="form-control"
                placeholder="votre numero de téléphone"
                value=""
              />
            </div>
            <div class="col-md-12">
              <label class="labels">Adresse 1</label
              ><input
                type="text"
                class="form-control"
                placeholder="votre adresse"
                value=""
              />
            </div>
            <div class="col-md-12">
              <label class="labels">Code postale</label
              ><input
                type="text"
                class="form-control"
                placeholder="votre code postal"
                value=""
              />
            </div>
            <div class="col-md-12">
              <label class="labels">State</label
              ><input
                type="text"
                class="form-control"
                placeholder="enter address line 2"
                value=""
              />
            </div>
            <div class="col-md-12">
              <label class="labels">Area</label
              ><input
                type="text"
                class="form-control"
                placeholder="enter address line 2"
                value=""
              />
            </div>
            <div class="col-md-12">
              <label class="labels">Email ID</label
              ><input
                type="text"
                class="form-control"
                placeholder="enter email id"
                value=""
              />
            </div>
            <div class="col-md-12">
              <label class="labels">Education</label
              ><input type="text" class="form-control" placeholder="education" value="" />
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-md-6">
              <label class="labels">Country</label
              ><input type="text" class="form-control" placeholder="country" value="" />
            </div>
            <div class="col-md-6">
              <label class="labels">State/Region</label
              ><input type="text" class="form-control" value="" placeholder="state" />
            </div>
          </div>
          <div class="mt-5 text-center">
            <button class="btn btn-primary profile-button" type="button">
              Save Profile
            </button>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="p-3 py-5">
          <div class="d-flex justify-content-between align-items-center experience">
            <span>Edit Experience</span
            ><span class="border px-3 p-1 add-experience"
              ><i class="fa fa-plus"></i>&nbsp;Experience</span
            >
          </div>
          <br />
          <div class="col-md-12">
            <label class="labels">Experience in Designing</label
            ><input type="text" class="form-control" placeholder="experience" value="" />
          </div>
          <br />
          <div class="col-md-12">
            <label class="labels">Additional Details</label
            ><input
              type="text"
              class="form-control"
              placeholder="additional details"
              value=""
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<style type="text/css">
body {
  background: rgb(99, 39, 120);
}

.form-control:focus {
  box-shadow: none;
  border-color: #ba68c8;
}

.profile-button {
  background: rgb(99, 39, 120);
  box-shadow: none;
  border: none;
}

.profile-button:hover {
  background: #682773;
}

.profile-button:focus {
  background: #682773;
  box-shadow: none;
}

.profile-button:active {
  background: #682773;
  box-shadow: none;
}

.back:hover {
  color: #682773;
  cursor: pointer;
}

.labels {
  font-size: 11px;
}

.add-experience:hover {
  background: #ba68c8;
  color: #fff;
  cursor: pointer;
  border: solid 1px #ba68c8;
}
</style>
