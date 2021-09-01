import Vue from "vue";
import Login from "../views/user/Login.vue";
import Home from "../views/user/Home.vue";
import Main from "../views/user/Main.vue";
import Products from "../views/user/Products.vue";
import Product from "../views/user/Product.vue";
import Register from "../views/user/Register.vue";
import Lokacije from "../views/user/Lokacije.vue";
import Order from "../views/user/Order.vue";
import NotFound from "../views/user/NotFound.vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
    {
        path: "", component: Main,
        children: [
            {
                path: "home",
                name: "home",
                component: Home
            },
            {
                path: "/",
                name: "home",
                component: Home
            },
            {
                path: "/login", component: Login, name: "login",
                beforeEnter: (to, from, next) => {
                    if (!isLoggedIn()) {
                        next();
                    } else {
                        next('/');
                    }

                }
            },
            { path: "/product/:productId", component: Product, name: "product" },
            { path: "/shop", component: Products, name: "shop" },
            { path: "/register", component: Register, name: "register" },
            { path: "/lokacije", component: Lokacije, name: "lokacije" },
            {
                path: "/order", component: Order, name: "order",
                beforeEnter: (to, from, next) => {
                    if (isLoggedIn()) {
                        next();
                    } else {
                        next('/login');
                    }
                }
            },
        ]
    },
    {
        path: '/admin',
        component: () => import('@/views/admin/Index'),
        name: "admin",
        beforeEnter: (to, from, next) => {
            if (isLoggedIn() && isAdmin()) next()
            else next('/login')
        },
        children: [
            // Pages
            {
                name: 'change',
                path: 'change/:id?',
                component: () => import('@/views/admin/Change'),
            },
            {
                name: 'categories',
                path: 'categories',
                component: () => import('@/components/admin/Categories.vue'),
            },
            {
                name: 'products',
                path: 'products',
                component: () => import('@/components/admin/Products.vue'),
            },
            {
                name: 'users',
                path: 'users',
                component: () => import('@/components/admin/Users.vue'),
            },
            {
                name: 'orders',
                path: 'orders',
                component: () => import('@/components/admin/Orders.vue'),
            },
            // Tables
            {
                name: 'dashboard',
                path: 'dashboard',
                component: () => import('@/views/admin/Dashboard'),
            },
            {
                name: 'home',
                path: '',
                component: () => import('@/views/admin/Dashboard'),
            },
            // Upgrade
            {
                name: 'display',
                path: 'users',
                component: () => import('@/views/admin/Display'),
                children: [
                    {
                        path: ":id"
                    }
                ]
            },
        ],
    },
    { path: "*", component: NotFound }
];

// console.log(routes)

const router = new VueRouter({
    routes // short for `routes: routes`
})
// const router = null
export default router;

var actor = localStorage.getItem('actor')

function isLoggedIn() {
    if (actor) return true
    return false
}
console.log(JSON.parse(actor))
function isAdmin() {
    var user = JSON.parse(actor)
    if (user.AllowedUseCases.includes(30))
        return true
    return false

}