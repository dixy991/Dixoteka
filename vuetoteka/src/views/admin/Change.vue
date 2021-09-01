<template>
  <v-container id="user-profile" class="mt-15" fluid tag="section">
    <v-row justify="center">
      <v-col cols="12" md="8">
        <base-material-card>
          <template v-slot:heading class="pink" color="pink">
            <div class="display-2 font-weight-light" v-if="id">Izmeni - {{name}}</div>
            <div class="display-2 font-weight-light" v-else>Dodaj novi u - {{name}}</div>
          </template>

          <v-form>
            <v-container class="py-0">
              <v-row>
                <v-col cols="12" md="6" v-for="(h, i) in headers" :key="i">
                  <div v-for="(j, jindex) in itemVal" :key="jindex">
                    <v-text-field
                      :label="h"
                      v-if="i==jindex&&j!='image'&&j!='password'&&j!='description'&&j!='categoryId'&&j!='isNew'"
                      v-model="item[j]"
                      class="purple-input"
                    />
                    <!-- za lozinku korisnika -->
                    <v-text-field
                      :label="h"
                      v-if="i==jindex&&j=='password'&&!id"
                      v-model="item[j]"
                      class="purple-input"
                    />
                    <!-- za kategoriju proizvoda -->
                    <v-autocomplete
                      v-model="item[j]"
                      :items="categories"
                      item-text="name"
                      item-value="id"
                      dense
                      class="mt-5"
                      label="Kategorija"
                      v-if="j=='categoryId'&&i==jindex"
                    ></v-autocomplete>
                    <!-- za novitet proizvoda -->
                    <v-checkbox
                      class="mt-n8"
                      label="Novo"
                      v-if="j=='isNew'&&i==jindex"
                      v-model="item.isNew"
                    ></v-checkbox>
                  </div>
                </v-col>

                <v-col cols="12" class="text-right">
                  <v-btn
                    color="pink lighten-2 white--text"
                    @click="updateItem"
                    v-if="id"
                    class="mr-0"
                  >Izmeni</v-btn>
                  <v-btn
                    color="pink lighten-2 white--text"
                    @click="addItem"
                    v-else
                    class="mr-0"
                  >Dodaj</v-btn>
                </v-col>
              </v-row>
            </v-container>
          </v-form>
        </base-material-card>
        <v-alert :type="success" v-if="success" class="mt-5">{{message}}</v-alert>
        <!-- <v-alert type="error" v-else class="mt-5">Greska</v-alert> -->
        <div v-if="errors.length" class="mt-5">
          <v-alert type="error" v-for="(e,i) in errors" :key="i">{{e.ErrorMessage}}</v-alert>
        </div>
      </v-col>

      <v-col cols="12" md="4" v-if="name=='products'">
        <base-material-card
          class="v-card-profile"
          avatar="https://demos.creative-tim.com/vue-material-dashboard/img/marc.aba54d65.jpg"
        >
          <v-card-text class="text-center">
            <v-textarea
              v-model="item.description"
              solo
              name="input-7-4"
              v-if="name=='products'"
              label="Opis"
            ></v-textarea>
            <!-- za sliku -->
            <input
              id="slika"
              type="file"
              v-if="name='products'"
              accept="image/*"
              class="purple-input"
              @change="uploadImage($event)"
            />
            <!-- <v-btn color="success" rounded class="mr-0">Follow</v-btn> -->
          </v-card-text>
        </base-material-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  //
  name: "AdminUserEdit",
  data: () => ({
    apiUrl: "http://localhost:5000/api/",
    jwtToken: null,
    id: null,
    headers: null,
    itemVal: null,
    item: {},
    name: null,
    data: null,
    categories: null,
    success: null,
    message: null,
    errors: []
  }),
  mounted() {
    this.id = this.$route.params.id;
    this.jwtToken = this.jwt;
    this.headers = this.$store.state.headers;
    this.itemVal = this.$store.state.itemVal;
    this.name = this.$store.state.itemName;
    this.categories = this.$store.state.categories;
    console.log(this.categories);

    for (let index = 0; index < this.itemVal.length; index++) {
      this.item[this.itemVal[index]] = null;
    }
    // this.item["isNew"] = false;
    // console.log(this.item);
    // console.log(this.itemVal);
    if (this.id) this.getItem();
  },
  methods: {
    getItem() {
      axios
        .get(this.apiUrl + this.name + "/" + this.id, {
          headers: {
            Authorization: "Bearer " + this.jwtToken
          }
        })
        .then(response => {
          this.item = response.data;
          console.log(this.item);
        });
    },
    addItem() {
      if (this.data) this.item = this.data;
      console.log(this.item);
      axios
        .post(this.apiUrl + this.name, this.item, {
          headers: {
            Authorization: "Bearer " + this.jwtToken
          }
        })
        .then(response => {
          console.log(response);
          // this.$router.push("/users");
          this.success = true;
          this.message = "Uspesno dodato";
        })
        .catch(error => {
          console.log(error.response);
          this.errors = error.response.data.errors;
          this.success = false;
          // this.message = "Greska";
        });
    },
    updateItem() {
      if (this.data) this.item = this.data;
      axios
        .put(this.apiUrl + this.name + "/" + this.id, this.item, {
          headers: {
            Authorization: "Bearer " + this.jwtToken
          }
        })
        .then(response => {
          console.log(response);
          if (response.status == 204) {
            this.success = true;
            this.message = "Uspesno izmenjeno";
          }
        })
        .catch(error => {
          console.log(error.response);
          this.errors = error.response.data.errors;
          this.success = false;
          this.message = "Greska";
        });
    },
    uploadImage(e) {
      this.data = new FormData();
      for (let index = 0; index < this.itemVal.length; index++) {
        if (this.itemVal[index] == "isNew")
          this.item[this.itemVal[index]] = false;
        this.data.append(this.itemVal[index], this.item[this.itemVal[index]]);
      }
      // data.append("name", "uploadedImage");
      this.data.append(
        "uploadedImage",
        e.target.files[0],
        e.target.files[0].name
      );
      // this.item.uploadedImage = this.data;
      console.log(e);
    }
  },

  computed: {
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>
