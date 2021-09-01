<template>
  <v-container id="upgrade" class="mt-2" fluid tag="section">
    <v-row justify="center">
      <v-col cols="1"></v-col>
      <v-col cols="3" class="mx-auto mb-5">
        <v-text-field type="number" label="Po stranici" @input="getItems" v-model="search.perPage"></v-text-field>
      </v-col>
      <v-col cols="1"></v-col>
      <v-col cols="12" md="8">
        <base-material-card color="pink lighten-2">
          <template v-slot:heading>
            <div class="d-flex justify-space-between">
              <div class="display-2 font-weight-light text-capitalize">{{naziv}}</div>
              <router-link to="change" v-if="name!='orders'">
                <v-icon>mdi-plus-circle</v-icon>
              </router-link>
            </div>
          </template>

          <v-simple-table>
            <thead>
              <tr>
                <th
                  v-for="(h, i) in headers"
                  :key="i"
                  class="subheading font-weight-light text-left"
                >{{h}}</th>
                <th v-if="name!='orders'" class="subheading font-weight-light text-center">Izmena</th>
                <th v-if="name!='orders'" class="subheading font-weight-light text-center">Brisanje</th>
              </tr>
            </thead>
            <tbody class="text-center">
              <tr v-for="(i, index) in items" :key="index">
                <th
                  v-for="(j, jindex) in itemVal"
                  :key="jindex"
                  class="text-left font-weight-light subtitle-1"
                >{{i[j]}}</th>
                <td v-if="name!='orders'">
                  <router-link :to="{ name: 'change', params: { id: i.id }}">
                    <v-icon color="pink lighten-2">mdi-account-edit-outline</v-icon>
                  </router-link>
                </td>
                <td v-if="name!='orders'">
                  <v-icon color="pink lighten-2" @click="deleteItem(i.id)">mdi-trash-can-outline</v-icon>
                </td>
              </tr>
            </tbody>
          </v-simple-table>
        </base-material-card>
        <v-pagination
          v-model="search.page"
          class="my-10"
          color="pink lighten-3"
          :length="pagesCount"
          @input="getItems"
          circle
        ></v-pagination>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  name: "AdminUsers",
  props: {
    headers: {
      type: Array,
      required: false
    },
    items: {
      type: Array,
      required: false
    },
    itemVal: {
      type: Array,
      required: false
    },
    search: {
      type: Object,
      required: false
    },
    pagesCount: {
      type: Number,
      required: false
    },
    name: {
      type: String,
      required: false
    },
    naziv: {
      type: String,
      required: false
    }
  },
  data: () => ({
    users: null,
    jwtToken: null,
    apiUrl: "http://localhost:5000/api/"
  }),
  mounted() {
    this.jwtToken = this.jwt;
    // this.items = this.$store.state.items;
  },
  methods: {
    getItems() {
      this.$emit("paginate", this.search);
    },
    deleteItem(id) {
      axios
        .delete(this.apiUrl + this.name + "/" + id, {
          headers: {
            Authorization: "Bearer " + this.jwtToken
          },
          data: {
            id: id
          }
        })
        .then(response => {
          //refirekcija zar ne
          location.reload();
          console.log(response);
        })
        .catch(error => {
          console.log(error.response);
          this.error = error.response.data.status;
        });
    }
  },

  computed: {
    jwt() {
      return localStorage.getItem("accessToken");
    }
  }
};
</script>


<style lang="sass">
  #upgrade
    .v-data-table
      th, td
        border: none !important
</style>
