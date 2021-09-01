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
  name: "AdminCategories",
  components: {
    AdminUsers
  },
  data: () => ({
    headers: ["Naziv"],
    itemVal: ["name"],
    items: null,
    apiUrl: "http://localhost:5000/api/",
    searchObject: {
      keyword: null,
      perPage: 5,
      page: 1
    },
    pagesCount: null,
    name: "categories",
    naziv: "kategorije"
  }),
  mounted() {
    this.jwtToken = this.jwt;
    this.$store.commit("SET_HEADERS", this.headers);
    this.$store.commit("SET_ITEM_VAL", this.itemVal);
    this.$store.commit("SET_ITEM_NAME", this.name);
    this.getCategories();
  },
  methods: {
    getCategories() {
      axios
        .get(this.apiUrl + "categories", {
          headers: {
            Authorization: "Bearer " + this.jwtToken
          },
          params: this.searchObject
        })
        .then(response => {
          this.items = response.data.items;
          this.pagesCount = response.data.pagesCount;
          this.$store.commit("SET_CATEGORIES", this.items);

          // console.log(this.items);
        });
    },
    paginateItems(search) {
      this.searchObject = search;
      this.getCategories();
    }
  },
  computed: {
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>