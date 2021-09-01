<template>
  <v-container>
    <v-row class="text-center mb-5">
      <v-col cols="12 my-5">
        <h1>Uloguj se</h1>
      </v-col>

      <v-col class="mb-5" cols="6" offset="3">
        <p class="font-weight-bold mb-3">
          <router-link to="/register" class="pink--text">Nemas nalog?Kreiraj ga!</router-link>
        </p>
        <v-text-field v-model="user.username" label="Username" required></v-text-field>

        <v-text-field v-model="user.password" label="Password" type="password" required></v-text-field>

        <v-btn color="pink lighten-3" class="mr-4" @click="login">Login</v-btn>
      </v-col>
    </v-row>

    <v-row v-if="error">
      <v-col cols="4" class="mx-auto">
        <v-alert type="error">Ne postoji nalog sa tim vrednostima</v-alert>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  name: "Login",

  data: () => ({
    user: {
      username: "",
      password: ""
    },
    apiUrl: "http://localhost:5000/api/",
    categories: [],
    headers: [
      { text: "Identifier", value: "id" },
      { text: "Category name", value: "name" }
    ],
    categoryName: "",
    error: ""
  }),
  methods: {
    login() {
      axios
        .post(this.apiUrl + "token", this.user)
        .then(response => {
          // console.log(response);
          var token = response.data.token;
          var userClaimData = token.split(".")[1];
          var claimObject = JSON.parse(atob(userClaimData));
          // var loggedUser = JSON.parse(claimObject.ActorData);
          //cuvanje
          localStorage.setItem("accessToken", token);
          localStorage.setItem("actor", claimObject.ActorData);

          location.reload();

          //refirekcija zar ne
        })
        .catch(error => {
          console.log(error.response);
          this.error = error.response.data.status;
        });
    }
  },
  computed: {
    //kao get metoda i pristupa joj se poput svojstva
    // loggedUser() {
    //   var localStorageUser = localStorage.getItem("actor");
    //   if (localStorageUser) return JSON.parse(localStorageUser);
    //   return null;
    // },
    // jwt() {
    //   return localStorage.getItem("accessToken");
    // }
  }
};
</script>
