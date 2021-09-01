<template>
  <div>
    <div :class="isProduct?'mx-5 mt-5':'d-flex justify-space-between mx-5 mt-10'">
      <p :class="isProduct?'text-h2':''">{{product.name}}</p>
      <p>{{product.price}} RSD</p>
    </div>
    <hr class="mx-5" />
    <p class="ma-5 mb-10">{{product.description}}</p>
    <div class="d-flex quantity justify-space-between mx-5">
      <span>Kolicina:</span>
      <v-text-field type="number" min="1" v-model="cart.quantity" class="px-15 pt-0 mt-0"></v-text-field>
    </div>
    <div class="d-flex justify-start">
      <v-btn
        class="pink lighten-3 mx-5 mb-10"
        @click="dodajUkorpu"
        v-if="isLoggedIn"
        color="black"
        text
      >Dodaj u korpu</v-btn>
      <v-btn class="pink--text mx-5 mb-10" v-if="!isProduct" outlined color="black" text>Detaljnije</v-btn>
    </div>
    <div class="mx-5">
      <h5 class="text-h5 font-weight-bold">INFORMACIJE O DOSTAVI</h5>
      <p
        class="my-5"
      >Dostava za Beograd se realizuje u saradnji sa kurirskom službom Star. Porudžbine primljene danas do 16h se mogu isporučiti najranije sutra. Porudžbine primljene posle 16h se mogu isporučiti najranije prekosutra. Na stranici za potvrdu porudžbine izaberite tačan datum i okvirno vreme za isporuku.</p>
      <h5 class="text-h5 font-weight-bold">DODATNE INFORMACIJE</h5>
      <p
        class="my-5"
      >Ukoliko želite da izbacimo alegen, napišite nam koji u polje INSTRUKCIJE. Napomena: Ne postoji mogućnost stavljanja poklona. Sadržaj proizvoda i kutije se ne menja. Na ovim krofnama nije moguće ispisivanje.</p>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "ProductNCartItem",
  props: {
    isProduct: {
      type: Boolean,
      required: false
    },
    product: {
      type: Object,
      required: false
    }
  },
  data: () => ({
    apiUrl: "http://localhost:5000/api/",
    cart: {
      quantity: 1,
      price: null,
      productId: null,
      productName: null,
      userId: null
    }
  }),
  methods: {
    dodajUkorpu() {
      this.cart.userId = this.getUser.Id;
      this.cart.price = this.product.price;
      this.cart.productId = this.product.id;
      this.cart.productName = this.product.name;
      this.cart.quantity = parseInt(this.cart.quantity);
      const jwtToken = this.jwt;
      location.reload();
      //u bazu
      axios
        .post(this.apiUrl + "cart", this.cart, {
          headers: {
            Authorization: "Bearer " + jwtToken
          }
        })
        .then(response => {
          //refirekcija zar ne
          console.log(response);
        })
        .catch(error => {
          console.log(error.response);
          this.error = error.response.data.status;
        });
    }
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
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>