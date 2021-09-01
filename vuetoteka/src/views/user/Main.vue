<template>
  <v-app>
    <v-app-bar app color="pink lighten-3" dark>
      <Navigation
        @open-cart="showCart=true"
        :num="numOfItemsInCart"
        :links="links"
        :staticLinks="staticLinks"
      ></Navigation>
    </v-app-bar>
    <v-main>
      <router-view></router-view>
      <FullCart
        @close-cart="showCart=false"
        @open-cart="showCart=true"
        :items="cartItems"
        v-if="showCart"
        :total="total"
      ></FullCart>
    </v-main>

    <v-footer class="pink lighten-3">
      <Footer :links="links" :staticLinks="staticLinks"></Footer>
    </v-footer>
  </v-app>
</template>

<script>
import Navigation from "../../components/user/Navigation.vue";
import Footer from "../../components/user/Footer.vue";
import FullCart from "../../components/user/FullCart.vue";
import axios from "axios";

export default {
  name: "Main",
  components: { Navigation, Footer, FullCart },
  data: () => ({
    links: [
      {
        path: "/",
        name: "Početna",
        logged: true,
        admin: false
      },
      {
        path: "/shop",
        name: "Poručivanje",
        logged: true,
        admin: false
      },
      {
        path: "/login",
        name: "Nalog",
        logged: false,
        admin: false
      },
      {
        path: "/admin",
        name: "AdminPanel",
        logged: true,
        admin: true
      }
    ],
    staticLinks: [
      {
        path: "/",
        name: "O nama"
      },
      {
        path: "/shop",
        name: "Kontakt"
      },
      {
        path: "/lokacije",
        name: "Lokacije"
      }
    ],
    apiUrl: "http://localhost:5000/api/",
    numOfItemsInCart: 0,
    novibus: null,
    cartItems: [],
    showCart: false,
    total: 0
  }),

  created() {
    // console.log(bus);
    // bus.$on("update-cart-num", x => {
    //   console.log(x);
    // });
  },
  mounted() {
    if (!this.isAdmin && this.isLoggedIn) {
      const userId = this.getUser.Id;
      const jwtToken = this.jwt;
      // console.log(bus);

      this.getCartItems(userId, jwtToken);
    }
    this.links = this.filterNavLinks;
    console.log(this.links);
  },
  computed: {
    getUser() {
      var user = JSON.parse(localStorage.getItem("actor"));
      return user;
    },
    isLoggedIn() {
      var localStorageUser = localStorage.getItem("actor");
      if (localStorageUser) return true;
      return false;
    },
    isAdmin() {
      if (this.isLoggedIn) {
        var user = this.getUser;
        if (user.AllowedUseCases.includes(30)) return true;
        return false;
      }
      return false;
    },
    filterNavLinks() {
      return this.links.filter(this.isForAdmin);
    },

    jwt() {
      return localStorage.getItem("accessToken");
    }
  },
  methods: {
    getCartItems(userId, jwtToken) {
      axios
        .get(this.apiUrl + "cart" + "/" + userId, {
          headers: {
            Authorization: "Bearer " + jwtToken
          }
        })
        .then(response => {
          //refirekcija zar ne
          this.cartItems = response.data.items;
          this.total = response.data.total;
          this.numOfItemsInCart = response.data.items.length;
          // console.log(this.cartItems);
        })
        .catch(error => {
          console.log(error.response);
          this.error = error.response.data.status;
        });
    },
    isForAdmin(link) {
      if (this.isLoggedIn) {
        if (this.isAdmin) {
          return link.logged && link.admin;
        }
        return link.logged && !link.admin;
      }
      return !link.admin;
    }
  }
};
</script>