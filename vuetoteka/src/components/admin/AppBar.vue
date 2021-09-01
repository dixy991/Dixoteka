<template>
  <v-app-bar id="app-bar" absolute app color="transparent" flat height="75">
    <v-btn
      class="mr-3"
      elevation="1"
      fab
      small
      @click="$store.commit('SET_DRAWER',!$store.state.drawer)"
    >
      <v-icon v-if="value">mdi-view-quilt</v-icon>

      <v-icon v-else>mdi-dots-vertical</v-icon>
    </v-btn>

    <v-toolbar-title
      class="hidden-sm-and-down font-weight-light text-capitalize"
      v-text="$route.name"
    />

    <v-spacer />

    <!-- <v-text-field
      :label="$t('search')"
      @input="getItems"
      v-model="search.keyword"
      color="secondary"
      hide-details
      style="max-width: 265px;"
    >
      <template v-if="$vuetify.breakpoint.mdAndUp" v-slot:append-outer>
        <v-btn class="mt-n2" elevation="1" fab small>
          <v-icon>mdi-magnify</v-icon>
        </v-btn>
      </template>
    </v-text-field>-->

    <div class="mx-3" />
  </v-app-bar>
</template>

<script>
// Components

// Utilities
import axios from "axios";

export default {
  name: "DashboardCoreAppBar",

  components: {},

  props: {
    value: {
      type: Boolean,
      default: false
    }
  },

  data: () => ({
    items: null,
    name: null,
    search: {
      keyword: null
    },
    apiUrl: "http://localhost:5000/api/"
  }),
  mounted() {
    // this.getItems();
  },
  computed: {},

  methods: {
    getItems() {
      this.name = this.$store.state.itemName;
      this.search = this.$store.state.search;
      console.log(this.$store);
      console.log(this.search);
      axios
        .get(this.apiUrl + this.name, { params: this.search })
        .then(response => {
          this.$store.commit("SET_ITEMS", response.data.items);
          console.log(response);
          this.pagesCount = response.data.pagesCount;
        });
    }
  }
};
</script>
