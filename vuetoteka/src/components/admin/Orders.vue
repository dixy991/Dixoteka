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
    headers: ["User's Id", "City", "Address", "Phone", "Deliver Date"],
    itemVal: ["userId", "city", "address", "phone", "deliverDate"],
    items: null,
    apiUrl: "http://localhost:5000/api/",
    searchObject: {
      keyword: null,
      perPage: 10,
      page: 1
    },
    pagesCount: null,
    name: "orders",
    naziv: "porudzbine"
  }),
  mounted() {
    this.jwtToken = this.jwt;

    this.getOrders();
  },
  methods: {
    getOrders() {
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
      this.getOrders();
    }
  },
  computed: {
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>