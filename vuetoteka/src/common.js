import axios from "axios";
//nzm kako ovo onda
export const apiUrl = "http://localhost:5000/api/"

export const prodMixin = {
    methods: {
        getCategories: function () {

        },
        getProductsMixin: function (searchObject) {
            return axios.get(apiUrl + "products", { params: searchObject })
        }
    }
}