<template>
  <v-container>
    <v-row>
      <v-col cols="12" class="text-center mt-3">
        <h1>Registruj se</h1>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="7" class="mx-auto">
        <validation-observer ref="observer" v-slot="{ invalid }">
          <form @submit.prevent="submit">
            <validation-provider v-slot="{ errors }" name="Ime" rules="required">
              <v-text-field v-model="user.firstName" :error-messages="errors" label="Ime" required></v-text-field>
            </validation-provider>
            <validation-provider v-slot="{ errors }" name="Prezime" rules="required">
              <v-text-field
                v-model="user.lastName"
                :error-messages="errors"
                label="Prezime"
                required
              ></v-text-field>
            </validation-provider>
            <validation-provider v-slot="{ errors }" name="Korisnicko ime" rules="required">
              <v-text-field
                v-model="user.username"
                :error-messages="errors"
                label="Korisnicko ime"
                required
              ></v-text-field>
            </validation-provider>
            <validation-provider v-slot="{ errors }" name="Lozinka" rules="required|min:7">
              <v-text-field
                v-model="user.password"
                :error-messages="errors"
                label="Lozinka"
                required
              ></v-text-field>
            </validation-provider>
            <validation-provider v-slot="{ errors }" name="email" rules="required|email">
              <v-text-field v-model="user.email" :error-messages="errors" label="E-mail" required></v-text-field>
            </validation-provider>
            <div class="mt-2 text-center">
              <v-btn class="mr-4" type="submit" :disabled="invalid">Submit</v-btn>
              <v-btn @click="clear">Obrisi</v-btn>
            </div>
          </form>
        </validation-observer>
      </v-col>
    </v-row>
    <v-row v-if="errors.length">
      <v-col cols="5" class="mx-auto mt-5">
        <v-alert type="error" v-for="e in errors" :key="e.PropertyName">{{e.ErrorMessage}}</v-alert>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
import { required, email, min } from "vee-validate/dist/rules";
import {
  extend,
  ValidationObserver,
  ValidationProvider,
  setInteractionMode
} from "vee-validate";
import axios from "axios";

setInteractionMode("eager");

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
  name: "Register",
  components: {
    ValidationProvider,
    ValidationObserver
  },
  data: () => ({
    user: {
      firstName: "",
      lastName: "",
      username: "",
      password: "",
      email: ""
    },
    apiUrl: "http://localhost:5000/api/",
    errors: []
  }),

  methods: {
    submit() {
      this.$refs.observer.validate();
      axios
        .post(this.apiUrl + "users", this.user)
        .then(response => {
          console.log(response);
        })
        .catch(error => {
          console.log(error.response);
          this.errors = error.response.data.errors;
        });
    },
    clear() {
      this.user.firstName = "";
      this.user.lastName = "";
      this.user.username = "";
      this.user.password = "";
      this.user.email = "";
      this.$refs.observer.reset();
    }
  }
};
</script>