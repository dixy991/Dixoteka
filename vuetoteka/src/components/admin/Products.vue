<template>
  <AdminUsers
    :items="items"
    @paginate="paginateItems"
    :search="searchObject"
    :pagesCount="pagesCount"
    :headers="headers"
    :itemVal="itemVal"
    :name="name"
    :naziv="naziv"
  ></AdminUsers>
</template>
<script>
import axios from "axios";
import AdminUsers from "../../views/admin/Display.vue";

export default {
  name: "AdminProducts",
  components: {
    AdminUsers
  },
  data: () => ({
    headers: ["Naziv", "Cena", "Kolicina"],
    itemVal: ["name", "price", "quantity"],
    fullHeaders: [
      "Naziv",
      "Cena",
      "Kolicina",
      "Kategorija",
      "Opis",
      "Slika",
      "Novo"
    ],
    fullItemVal: [
      "name",
      "price",
      "quantity",
      "categoryId",
      "description",
      "image",
      "isNew"
    ],
    items: null,
    apiUrl: "http://localhost:5000/api/",
    searchObject: {
      keyword: null,
      perPage: 5,
      page: 1
    },
    pagesCount: null,
    name: "products",
    naziv: "proizvodi"
  }),
  mounted() {
    this.jwtToken = this.jwt;
    this.$store.commit("SET_HEADERS", this.fullHeaders);
    // this.$store.commit("SET_SEARCH", this.searchObject);
    this.$store.commit("SET_ITEM_VAL", this.fullItemVal);
    this.$store.commit("SET_ITEM_NAME", this.name);
    this.getProducts();
  },
  methods: {
    getProducts() {
      axios
        .get(this.apiUrl + this.name, {
          headers: {
            Authorization: "Bearer " + this.jwtToken
          },
          params: this.searchObject
        })
        .then(response => {
          this.items = response.data.items;
          this.pagesCount = response.data.pagesCount;

          console.log(this.items);
        });
    },
    paginateItems(search) {
      this.searchObject = search;
      this.getProducts();
    }
  },
  computed: {
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>