<template>
  <v-container>
    <v-row>
      <v-col cols="12">
        <h1>Korpa i kupovina</h1>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="5">
        <CartItem v-for="i in cartItems" :key="i.id" :i="i"></CartItem>
        <div class="d-flex justify-space-between align-center my-5 mb-2">
          <h3 class="my-5">
            Ukupno:
            <span class="pink--text">{{total}} RSD</span>
          </h3>
        </div>
      </v-col>
      <v-col cols="7">
        <v-card>
          <v-card-text>
            <validation-provider ref="observer" v-slot="{ invalid }">
              <form @submit.prevent="submit">
                <div class="d-flex justify-space-between">
                  <validation-provider
                    v-slot="{ errors }"
                    name="Kontakt telefon"
                    :rules="{required: true,digits: 13}"
                  >
                    <v-text-field
                      v-model="order.Phone"
                      :error-messages="errors"
                      label="Kontakt telefon"
                      required
                    ></v-text-field>
                  </validation-provider>
                  <validation-provider v-slot="{ errors }" name="Postanski broj" rules="required">
                    <v-text-field
                      v-model="order.ZIPCode"
                      :error-messages="errors"
                      label="Postanski broj"
                      required
                    ></v-text-field>
                  </validation-provider>

                  <validation-provider v-slot="{ errors }" name="Grad" rules="required">
                    <v-text-field
                      v-model="order.City"
                      :error-messages="errors"
                      label="Grad"
                      required
                    ></v-text-field>
                  </validation-provider>
                </div>
                <validation-provider v-slot="{ errors }" name="Adresa" rules="required|min:7">
                  <v-text-field
                    v-model="order.Address"
                    :error-messages="errors"
                    label="Adresa"
                    required
                  ></v-text-field>
                </validation-provider>
                <validation-provider v-slot="{ errors }" name="Datum isporuke" rules="required">
                  <v-text-field
                    v-model="order.DeliverDate"
                    :error-messages="errors"
                    label="Datum isporuke"
                    required
                    type="datetime-local"
                  ></v-text-field>
                </validation-provider>
                <validation-provider name="checkbox">
                  <v-checkbox
                    v-model="order.IsGift"
                    label=" Da li se ova porudžbina isporučuje kao poklon drugoj osobi? "
                    type="checkbox"
                  ></v-checkbox>
                </validation-provider>
                <v-textarea
                  v-model="order.Note"
                  name="note"
                  label="Napomena"
                  placeholder="Dodatne napomene"
                  hint="Upišite sve druge bitne informacije za realizaciju porudžbine."
                ></v-textarea>
                <div class="mt-2 text-center">
                  <v-btn
                    class="mr-4 w-100 pink white--text"
                    type="submit"
                    :disabled="invalid"
                  >Poruci</v-btn>
                </div>
              </form>
            </validation-provider>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import axios from "axios";
import CartItem from "../../components/user/CartItem.vue";
import { required, email, digits, min } from "vee-validate/dist/rules";
import { extend, ValidationProvider, setInteractionMode } from "vee-validate";
setInteractionMode("eager");

extend("digits", {
  ...digits,
  message: "{_field_} mora imati {length} cifara."
});
extend("required", {
  ...required,
  message: "{_field_} ne sme biti prazno."
});

extend("min", {
  ...min,
  message: "{_field_} mora imati minimum {length} karaktera"
});

extend("email", {
  ...email,
  message: "Email nije u dobrom formatu - primer@gmail.com"
});
export default {
  name: "Order",
  components: {
    CartItem,
    ValidationProvider
  },
  mounted() {
    const userId = this.getUser.Id;
    const jwtToken = this.jwt;
    // this.order.UserId = userId;
    this.jwtT = jwtToken;
    // console.log(bus);

    this.getCartItems(userId, jwtToken);
    // console.log(this.cartItems);
  },
  data: () => ({
    cartItems: [],
    total: 0,
    apiUrl: "http://localhost:5000/api/",
    order: {
      Phone: "",
      Address: "",
      City: "",
      ZIPCode: "",
      IsGift: false,
      Note: "",
      DeliverDate: ""
    },
    errors: [],
    jwtT: null
  }),
  computed: {
    getUser() {
      var user = JSON.parse(localStorage.getItem("actor"));
      return user;
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
          // console.log(this.cartItems);
        })
        .catch(error => {
          console.log(error.response);
          this.error = error.response.data.status;
        });
    },
    submit() {
      this.$refs.observer.validate();
      console.log(this.order);
      axios
        .post(this.apiUrl + "orders", this.order, {
          headers: {
            Authorization: "Bearer " + this.jwtT
          }
        })
        .then(response => {
          this.$router.push("/shop");
          location.reload();
          console.log(response);
        })
        .catch(error => {
          console.log(error.response);
          this.errors = error.response.data.errors;
        });
    }
  }
};
</script>