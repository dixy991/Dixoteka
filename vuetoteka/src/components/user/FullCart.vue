<template>
  <v-slide-x-reverse-transition>
    <v-container fluid class="crnaPozadina">
      <v-row class="d-flex justify-end">
        <v-col cols="12" class="white">
          <div class="modal-header d-flex justify-space-between mx-5">
            <h2 class="my-5 mb-10">
              <v-icon color="pink">mdi-basket</v-icon>
              Tvoja porudzbina ({{items.length}})
            </h2>
            <v-icon @click="closeCart" class="mb-5">mdi-close</v-icon>
          </div>
          <div class="modal-body mx-5">
            <CartItem v-for="i in items" :key="i.id" :i="i"></CartItem>
            <div class="modal-footer d-flex justify-space-between align-center my-5 mb-2">
              <h3 class="my-5">Ukupno: {{total}} RSD</h3>
              <v-btn class="pink lighten-3 mr-3" @click="kupi" color="black" text>Kupi proizvode</v-btn>
            </div>
            <p>Prikazana je cena proizvoda i izabranih personalizacija bez troškova dostave</p>
          </div>
        </v-col>
      </v-row>
    </v-container>
  </v-slide-x-reverse-transition>
</template>
<style scoped>
</style>
<script>
import CartItem from "./CartItem.vue";

export default {
  name: "FullCart",
  components: {
    CartItem
  },
  methods: {
    closeCart() {
      this.$emit("close-cart");
    },
    kupi() {
      console.log("da");
      this.$router.push("/order");
      this.$emit("close-cart");
    }
  },
  props: {
    items: {
      type: Array,
      required: true
    },
    total: {
      type: Number,
      required: true
    }
  },
  mounted() {
    console.log(this.total);
  }
};
</script>