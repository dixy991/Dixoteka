<template>
  <v-container>
    <v-row>
      <v-col cols="4 d-flex align-center">
        <div>
          <router-link to="/">
            <v-img
              alt="Vuetify Logo"
              class="shrink mr-2"
              contain
              src="../../assets/img/group-11.svg"
              transition="scale-transition"
              width="120"
            />
          </router-link>
        </div>
      </v-col>
      <v-col cols="6">
        <v-row id="navigacija" justify="center" no-gutters>
          <v-col cols="12">
            <v-btn v-for="link in links" :key="link.name" color="white" text rounded class="my-2">
              <router-link :to="link.path" class="white--text">{{ link.name }}</router-link>
            </v-btn>
          </v-col>
        </v-row>
      </v-col>
      <v-col cols="2 d-flex align-center justify-end">
        <v-btn @click="openCart" v-if="!orderPage&&!isAdmin" target="_blank" text>
          <v-icon>mdi-basket</v-icon>
          <span class>({{num}})</span>
        </v-btn>
        <v-btn @click="logOut" v-if="isLoggedIn" target="_blank" text>
          <span class>Log out</span>
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>
<style>
#navigacija a,
ul li a {
  text-decoration: none;
}
ul {
  list-style-type: none;
}
</style>
<script>
export default {
  name: "Navigation",
  components: {},
  props: {
    links: {
      type: Array,
      required: true
    },
    staticLinks: {
      type: Array,
      required: true
    },
    num: {
      type: Number,
      required: false
    }
  },
  data: () => ({
    showCart: false,
    routeName: ""
  }),

  created() {},
  mounted() {
    this.routeName = this.$route.name;
  },
  computed: {
    isLoggedIn() {
      var localStorageUser = localStorage.getItem("actor");
      if (localStorageUser) return true;
      return false;
    },
    getUser() {
      var user = JSON.parse(localStorage.getItem("actor"));
      return user;
    },
    isAdmin() {
      if (this.isLoggedIn) {
        var user = this.getUser;
        if (user.AllowedUseCases.includes(30)) return true;
        return false;
      }
      return false;
    },
    loggedUserLinks() {
      if (this.isLoggedIn) {
        return this.links.filter(l => {
          return !l.logged;
        });
      }
      return this.links;
    },
    orderPage() {
      if (this.routeName == "order") return true;
      return false;
    }
  },
  methods: {
    openCart() {
      this.$emit("open-cart");
    },
    logOut() {
      localStorage.clear();
      this.$router.push("/login");
      location.reload();
    }
  }
};
</script>