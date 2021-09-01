<template>
  <div>
    <v-container fluid class="pink lighten-5">
      <v-container>
        <v-row>
          <v-col cols="12">
            <h1>Najpopularnije</h1>
            <v-row>
              <v-col class="mx-4" v-for="(p, index) in products" :key="index" cols="2">
                <ProductItem
                  :product="p"
                  :pid="p.id"
                  @update-cart="updateCart"
                  :showDescription="false"
                ></ProductItem>
              </v-col>
            </v-row>
          </v-col>
        </v-row>
      </v-container>
    </v-container>
    <v-container fluid class="blue lighten-5 pb-15">
      <v-container>
        <v-row>
          <v-col cols="12">
            <h1 class="my-5 mb-10">Lokacije</h1>
            <v-row id="lokacije">
              <v-col cols="4" v-for="(location,i) in locations" :key="i">
                <LocationItem :location="location"></LocationItem>
              </v-col>
            </v-row>
          </v-col>
        </v-row>
      </v-container>
    </v-container>
    <v-container fluid class="pink lighten-5 pb-10">
      <v-container>
        <v-row>
          <v-col cols="12">
            <h1 class="my-5 mb-10">Vesti</h1>
            <v-row>
              <v-col cols="10" class="mx-auto">
                <v-card elevation="2" class="py-5 px-15">
                  <v-card-title>PRIJAVI SE ZA SLATKE VESTI</v-card-title>
                  <v-card-text
                    class="black--text"
                  >Slatkoteka obaveštenja o novim proizvodima, akcijama i zanimljivostima iz carstva krofni…</v-card-text>
                  <div class="px-4 mb-3">
                    <v-text-field label="Upisite E-mail adresu*" required></v-text-field>
                    <v-checkbox label="Prihvatam uslove koriscenja*" required></v-checkbox>
                    <v-btn color="pink lighten-3" class="mr-4">Prijavi se</v-btn>
                  </div>
                </v-card>
              </v-col>
            </v-row>
          </v-col>
        </v-row>
      </v-container>
    </v-container>
    <Cart v-if="showCart" @close-cart="closeCart" :product="productCart"></Cart>
  </div>
</template>

<style>
#lokacije .col .v-card {
  height: 150px;
}
#roze-border {
  height: 100%;
  border: 2px dashed rgba(246, 80, 160, 0.32);
}
</style>
<script>
import axios from "axios";
import ProductItem from "../../components/user/ProductItem.vue";
import Cart from "../../components/user/Cart.vue";
import LocationItem from "../../components/user/LocationItem.vue";

export default {
  name: "Home",
  components: {
    ProductItem,
    Cart,
    LocationItem
  },
  mounted() {
    if (this.jwt) {
      var jwtToken = this.jwt;
    }

    this.getCategories(jwtToken);
    this.getProducts();
    this.locations = this.$store.state.locations;
  },
  created() {},
  data: () => ({
    searchObject: {
      keyword: null,
      perPage: 5,
      page: 1,
      categoryId: null
    },
    apiUrl: "http://localhost:5000/api/",
    products: [],
    categories: [],
    pagesCount: 0,
    showCart: false,
    productCart: null,
    locations: null
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
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>