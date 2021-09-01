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
    headers: ["First Name", "Last Name", "Username", "Email"],
    fullHeaders: ["First Name", "Last Name", "Username", "Email", "Password"],
    itemVal: ["firstName", "lastName", "username", "email"],
    fullItemVal: ["firstName", "lastName", "username", "email", "password"],
    items: null,
    apiUrl: "http://localhost:5000/api/",
    searchObject: {
      keyword: null,
      perPage: 5,
      page: 1
    },
    pagesCount: null,
    name: "users",
    naziv: "korisnici"
  }),
  mounted() {
    this.jwtToken = this.jwt;
    this.$store.commit("SET_HEADERS", this.fullHeaders);
    this.$store.commit("SET_ITEM_VAL", this.fullItemVal);
    this.$store.commit("SET_ITEM_NAME", this.name);
    this.getUsers();
  },
  methods: {
    getUsers() {
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
      this.getUsers();
    }
  },
  computed: {
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>