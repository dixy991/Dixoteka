<template>
  <v-container class="my-15">
    <v-row>
      <v-col cols="6">
        <v-img height="500" width="500" src="https://cdn.vuetifyjs.com/images/cards/cooking.png"></v-img>
        <v-alert
          class="mt-15"
          v-if="!isLoggedIn"
          colored-border
          type="error"
          elevation="2"
          width="500"
        >Ulogujte se da biste dodali u korpu</v-alert>
      </v-col>
      <v-col cols="6" class="pa-0">
        <ProductNCartItem :isProduct="true" :product="product"></ProductNCartItem>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import axios from "axios";
import ProductNCartItem from "../../components/user/ProductNCartItem.vue";

export default {
  name: "Product",

  components: {
    ProductNCartItem
  },
  props: {},
  data: () => ({
    product: null,
    apiUrl: "http://localhost:5000/api/"
  }),
  mounted() {
    const id = this.$route.params.productId;
    console.log(id);
    this.getProduct(id);
  },
  methods: {
    getProduct(id) {
      axios.get(this.apiUrl + "products" + "/" + id).then(response => {
        this.product = response.data;
        console.log(this.product);
      });
    }
  },
  computed: {
    isLoggedIn() {
      var localStorageUser = localStorage.getItem("actor");
      if (localStorageUser) return true;
      return false;
    }
  }
};
</script>