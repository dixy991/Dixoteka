<template>
  <v-card class="my-12 mx-auto pink lighten-5 kartica" max-width="254">
    <router-link class="black--text" :to="{ name: 'product', params: { productId: product.id }}">
      <v-img height="200" src="https://cdn.vuetifyjs.com/images/cards/cooking.png"></v-img>

      <v-card-title class="text-h5 font-weight-bold">{{product.name}}</v-card-title>
      <!-- desc -->
      <v-card-text v-if="showDescription">
        <div>{{product.description | truncate(100, '...')}}</div>
      </v-card-text>

      <v-divider class="mx-4"></v-divider>
      <!-- ako je new -->
      <v-card-title class="text-h5">{{product.price}} RSD</v-card-title>

      <v-card-text v-if="product.isNew" id="novo">
        <v-chip-group active-class=" accent-4 white--text" column>
          <!-- price -->
          <v-chip class="green">New</v-chip>
        </v-chip-group>
      </v-card-text>
    </router-link>

    <v-card-actions>
      <v-btn
        class="pink lighten-3 font-weight-bold text-h6 px-5"
        v-if="isLoggedIn"
        color="black"
        @click="dodajUkorpu(product)"
        text
      >Dodaj u korpu</v-btn>
    </v-card-actions>
  </v-card>
</template>
<style scoped>
.kartica {
  position: relative;
}
#novo {
  position: absolute;
  top: 0;
  right: 0;
}
</style>
<script>
export default {
  name: "ProductItem",
  props: {
    product: {
      type: Object,
      required: true
    },
    showDescription: {
      type: Boolean,
      required: false,
      default: true
    }
  },
  computed: {
    isLoggedIn() {
      var localStorageUser = localStorage.getItem("actor");
      if (localStorageUser) return true;
      return false;
    }
  },

  data: () => ({
    // showDescription: true
  }),
  methods: {
    dodajUkorpu(product) {
      this.$emit("update-cart", product);
    }
  }
};
</script>