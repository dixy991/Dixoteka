<template>
  <v-container id="regular-tables" fluid tag="section">
    <v-row>
      <v-col cols="3" class="mx-auto">
        <v-text-field
          type="number"
          label="Po stranici"
          @input="getLogs"
          v-model="searchObject.perPage"
        ></v-text-field>
      </v-col>
    </v-row>
    <div class="py-3" />

    <base-material-card
      color="pink lighten-2"
      icon="mdi-clipboard-plus"
      title="Tabela Aktivnosti"
      class="px-5 py-3"
    >
      <v-simple-table>
        <thead>
          <tr>
            <th>Korisnik</th>
            <th>Podaci</th>
            <th>Datum</th>
            <th>Naredba</th>
          </tr>
        </thead>

        <tbody>
          <tr v-for="(l, index) in logs" :key="index">
            <td>{{l.actor}}</td>
            <td>{{l.data}}</td>
            <td>{{l.date}}</td>
            <td>{{l.useCaseName}}</td>
          </tr>
        </tbody>
      </v-simple-table>
      <v-pagination
        v-model="searchObject.page"
        class="my-4"
        color="pink lighten-3"
        :length="pagesCount"
        @input="getLogs"
        circle
      ></v-pagination>
    </base-material-card>
  </v-container>
</template>
<script>
import axios from "axios";

export default {
  name: "AdminHome",
  data: () => ({
    logs: null,
    apiUrl: "http://localhost:5000/api/",
    searchObject: {
      keyword: null,
      perPage: 100,
      page: 1
    },
    pagesCount: null
  }),
  mounted() {
    this.getLogs();
  },
  methods: {
    getLogs() {
      var jwtToken = this.jwt;

      axios
        .get(this.apiUrl + "logs", {
          headers: {
            Authorization: "Bearer " + jwtToken
          },
          params: this.searchObject
        })
        .then(response => {
          this.logs = response.data.items;
          this.pagesCount = response.data.pagesCount;

          // console.log(this.logs);
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
