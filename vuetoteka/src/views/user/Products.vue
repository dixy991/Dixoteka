<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <h1 class="my-5">Poručivanje</h1>
        <p>Dobro došli u Dixoteka internet prodavnicu gde možete napraviti porudžbinu odmah za sutra ili neki drugi dan. Porudžbine primljene danas do 16h se mogu isporučiti najranije sutra. Porudžbine primljene posle 16h se mogu isporučiti najranije prekosutra. Na stranici za potvrdu kupovine izaberite tačan datum i okvirno vreme isporuke.</p>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        <h2>Pretraga</h2>
        <v-text-field
          class="mb-3 mt-5"
          v-model="searchObject.keyword"
          label="Pretraga po nazivu"
          :counter="50"
          required
        ></v-text-field>
        <v-autocomplete
          v-model="searchObject.categoryId"
          :items="categories"
          item-text="name"
          item-value="id"
          dense
          label="Kategorije proizvoda"
        ></v-autocomplete>
        <v-radio-group>
          <p>Oznaka</p>
          <v-checkbox
            label="Novo"
            @change="searchObject.isNew==null ? searchObject.isNew=true : searchObject.isNew=null"
          ></v-checkbox>
        </v-radio-group>
        <v-btn color="pink lighten-3" class="mr-4" @click="search">Search</v-btn>
        <v-alert
          class="mt-15"
          v-if="!isLoggedIn"
          colored-border
          type="error"
          elevation="2"
        >Ulogujte se da biste dodali u korpu</v-alert>
      </v-col>
      <v-col cols="8">
        <h1>Products</h1>
        <v-row>
          <v-col v-for="(p, index) in products" :key="index" cols="4">
            <ProductItem :product="p" :pid="p.id" @update-cart="updateCart"></ProductItem>
          </v-col>
        </v-row>
        <v-row justify="center" v-if="products.length">
          <v-col cols="4">
            <v-text-field
              type="number"
              label="Per page"
              @input="search"
              v-model="searchObject.perPage"
            ></v-text-field>
          </v-col>
          <v-col cols="8">
            <v-container class="max-width">
              <v-pagination
                v-model="searchObject.page"
                class="my-4"
                color="pink lighten-3"
                :length="pagesCount"
                @input="search"
                circle
              ></v-pagination>
            </v-container>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
    <Cart v-if="showCart" @close-cart="closeCart" :product="productCart"></Cart>
  </v-container>
</template>
<style  scoped>
</style>
<script>
import axios from "axios";
import ProductItem from "../../components/user/ProductItem.vue";
import Cart from "../../components/user/Cart.vue";

export default {
  name: "Products",
  components: {
    ProductItem,
    Cart
  },
  mounted() {
    if (this.jwt) {
      var jwtToken = this.jwt;
    }

    this.getCategories(jwtToken);
    this.getProducts();
  },
  data: () => ({
    searchObject: {
      keyword: null,
      perPage: 2,
      page: 1,
      categoryId: null,
      isNew: null
    },
    apiUrl: "http://localhost:5000/api/",
    products: [],
    categories: [],
    pagesCount: 0,
    showCart: false,
    productCart: null
  }),
  methods: {
    search() {
      axios
        .get(this.apiUrl + "products", { params: this.searchObject })
        .then(response => {
          this.products = response.data.items;
          this.pagesCount = response.data.pagesCount;
        });
    },
    getCategories(jwtToken) {
      //kategorije
      axios
        .get(this.apiUrl + "categories", {
          headers: {
            Authorization: "Bearer " + jwtToken
          },
          params: { perPage: 10 }
        })
        .then(response => {
          // console.log(response);
          this.categories = response.data.items;
        });
    },
    getProducts() {
      //proizvodi
      axios
        .get(this.apiUrl + "products", { params: this.searchObject })
        .then(response => {
          this.products = response.data.items;
          this.pagesCount = response.data.pagesCount;
        });
    },
    updateCart(p) {
      this.showCart = true;
      // console.log(p);
      this.productCart = p;
    },
    closeCart(f) {
      this.showCart = f;
    }
  },
  computed: {
    isLoggedIn() {
      var localStorageUser = localStorage.getItem("actor");
      if (localStorageUser) return true;
      return false;
    },
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>