<template>
  <v-slide-x-reverse-transition>
    <v-container fluid class="crnaPozadina" transition="slide-x-reverse-transition">
      <v-row class="d-flex justify-end">
        <v-col cols="12" class="white pa-0">
          <div class="modal-header d-flex justify-space-between mx-5">
            <h2 class="my-5 mb-10">Brzo porucivanje</h2>
            <v-icon @click="closeCart" class="mb-5">mdi-close</v-icon>
          </div>
          <div class="modal-body">
            <v-img height="300" src="https://cdn.vuetifyjs.com/images/cards/cooking.png"></v-img>
            <ProductNCartItem :isProduct="false" :product="product"></ProductNCartItem>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </v-slide-x-reverse-transition>
</template>
<style>
a {
  text-decoration: none;
}
html {
  /* overflow-y: hidden !important; */
}
.w-100 {
  width: 100% !important;
}
.crnaPozadina {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.62);
  z-index: 999;
}
.crnaPozadina .row {
  height: 100%;
  position: absolute;
  right: 0;
  width: 615px;
}
.crnaPozadina .row .col .modal-body {
  height: calc(100vh - 100px);
  position: absolute;
  overflow-y: auto;
}
.v-input__slot {
  /* width: 50% !important; */
}
</style>
<script>
import axios from "axios";
// import { bus } from "../main.js";
import ProductNCartItem from "./ProductNCartItem.vue";

export default {
  name: "Cart",
  data: () => ({
    cart: {
      quantity: 1,
      price: null,
      productId: null,
      productName: null,
      userId: null
    },
    apiUrl: "http://localhost:5000/api/"
  }),
  props: {
    product: {
      type: Object,
      required: false
    }
  },
  components: {
    ProductNCartItem
  },
  methods: {
    closeCart() {
      this.$emit("close-cart", false);
    },
    dodajUkorpu() {
      this.cart.userId = this.getUser.Id;
      this.cart.price = this.product.price;
      this.cart.productId = this.product.id;
      this.cart.productName = this.product.name;
      this.cart.quantity = parseInt(this.cart.quantity);
      const jwtToken = this.jwt;
      // bus.$emit("update-cart-num", "da");
      location.reload();
      // console.log(bus);

      //   console.log(this.cart);
      //u bazu
      axios
        .post(this.apiUrl + "cart", this.cart, {
          headers: {
            Authorization: "Bearer " + jwtToken
          }
        })
        .then(response => {
          //refirekcija zar ne
          console.log(response);
        })
        .catch(error => {
          console.log(error.response);
          this.error = error.response.data.status;
        });
    }
  },
  computed: {
    getUser() {
      var user = JSON.parse(localStorage.getItem("actor"));
      return user;
    },

    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>