import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import router from "./plugins/router"
import store from './store'
import './plugins/base'
import './plugins/chartist'
import i18n from './i18n'
import axios from "axios";

Vue.config.productionTip = false

new Vue({
  vuetify,
  router,
  store,
  i18n,
  axios,
  render: h => h(App)
}).$mount('#app')

var filter = function (text, length, clamp) {
  clamp = clamp || '...';
  return text.length > length ? text.slice(0, length) + clamp : text;
};

Vue.filter('truncate', filter);


export const bus = new Vue();
var apiUrl = "http://localhost:5000/api/"
var jwtToken = localStorage.getItem("accessToken")

var locations = [
  {
    title: "SLATKOTEKA 3",
    description: `Bulevar kralja Aleksandra 52, Beograd. Svakog dana od 09:00 do 21:00, nedeljom od 10:00 do 21:00`
  },
  {
    title: "SLATKOTEKA DORĆOL",
    description: ` Višnjićeva 5, Beograd. Svakog dana od 13:30 do 21:00`
  },
  {
    title: "USKORO:",
    description: `SLATKOTEKA NOVI BEOGRAD`
  }
]
store.commit("SET_LOCATIONS", locations)

var searchObject = {
  keyword: null,
  perPage: 5,
  page: 1
}
axios
  .get(apiUrl + "categories", {
    headers: {
      Authorization: "Bearer " + jwtToken
    },
    params: searchObject
  })
  .then(response => {
    // this.items = response.data.items;
    // this.pagesCount = response.data.pagesCount;
    store.commit("SET_CATEGORIES", response.data.items)
    console.log(response.data)
    // console.log(items);
  });
