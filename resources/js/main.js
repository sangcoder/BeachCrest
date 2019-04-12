import './bootstrap'

import Vue from 'vue'
import VueRouter from 'vue-router'
import { Form, HasError, AlertError } from 'vform'

// Component
import Dashboard from './components/Dashboard'
import Tour from './components/Tour'
import Customer from './components/Customer'

window.Form = Form
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

Vue.use(VueRouter)

let routes = [
  { path: '/dashboard', component: Dashboard },
  { path: '/tour', component: Tour, alias: '/danh-sach-tour.html' },
  { path: '/customer', component: Customer }
]

const router = new VueRouter({
  // mode: 'history',
  routes
})

const app = new Vue({
  el: '#app',
  router
})
