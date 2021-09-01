import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        barColor: 'rgba(240, 98, 146, 0.3), rgba(0, 0, 0, 0.7)',
        barImage: 'https://demos.creative-tim.com/material-dashboard/assets/img/sidebar-1.jpg',
        drawer: null,
        headers: null,
        itemVal: null,
        itemName: null,
        categories: null,
        items: null,
        search: null,
        locations: null
    },
    mutations: {
        SET_BAR_IMAGE(state, payload) {
            state.barImage = payload
        },
        SET_DRAWER(state, payload) {
            state.drawer = payload
        },
        SET_HEADERS(state, payload) {
            state.headers = payload
        },
        SET_ITEM_VAL(state, payload) {
            state.itemVal = payload
        },
        SET_ITEM_NAME(state, payload) {
            state.itemName = payload
        },
        SET_CATEGORIES(state, payload) {
            state.categories = payload
        },
        SET_ITEMS(state, payload) {
            state.items = payload
        },
        SET_SEARCH(state, payload) {
            state.search = payload
        },
        SET_LOCATIONS(state, payload) {
            state.locations = payload
        },
    },
    actions: {

    },
})
