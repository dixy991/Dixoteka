<template>
  <v-card class="d-flex justify-space-between" max-width="544" outlined>
    <v-img
      max-height="100"
      max-width="100"
      src="https://cdn.vuetifyjs.com/images/cards/cooking.png"
    ></v-img>
    <div class="w-100 d-flex justify-space-between align-start">
      <v-list-item three-line>
        <v-list-item-content>
          <v-list-item-title class="text-h6 mb-1">{{i.productName}}</v-list-item-title>
          <v-list-item-subtitle class="my-3">{{i.price}} RSD</v-list-item-subtitle>
          <v-list-item-subtitle>Kolicina: {{i.quantity}}</v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
      <v-icon @click="izbrisiItem(i.id)" class="mt-5 mr-3">mdi-trash-can-outline</v-icon>
    </div>
  </v-card>
</template>
<script>
import axios from "axios";

export default {
  name: "CartItem",
  props: {
    i: {
      type: Object,
      required: true
    }
  },

  data: () => ({
    apiUrl: "http://localhost:5000/api/"
  }),
  methods: {
    izbrisiItem(id) {
      const jwtToken = this.jwt;
      console.log(id);

      axios
        .delete(this.apiUrl + "cart" + "/" + id, {
          headers: {
            Authorization: "Bearer " + jwtToken
          },
          data: {
            id: id
          }
        })
        .then(response => {
          //refirekcija zar ne
          window.location.reload();
          //   this.$router.go();
          this.$emit("open-cart");

          console.log(response);
        })
        .catch(error => {
          console.log(error.response);
          this.error = error.response.data.status;
        });
    }
  },

  computed: {
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>