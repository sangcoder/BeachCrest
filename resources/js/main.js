import './bootstrap'

import Vue from 'vue'
import VueRouter from 'vue-router'
import { Form, HasError, AlertError } from 'vform'
import moment from 'moment'
import VueProgressBar from 'vue-progressbar'
import Swal from 'sweetalert2'

// Component
import Dashboard from './components/Dashboard'
import Tour from './components/Tour'
import Customer from './components/Customer'

window.Vue = Vue
window.Form = Form
window.Swal = Swal

Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

Vue.use(VueRouter)

let routes = [
  { path: '/dashboard', component: Dashboard },
  { path: '/tour', component: Tour, alias: '/danh-sach-tour.html' },
  { path: '/customer', component: Customer }
]

// Global ulti
Vue.filter('upText', function (text) {
  if (!text) return ''
  text = text.toString()
  return text.charAt(0).toUpperCase() + text.slice(1)
})

Vue.filter('myDate', function (date) {
  return moment(date).format('DD/MM/YYYY')
})

// Progress bar
const options = {
  color: '#bffaf3',
  failedColor: '#874b4b',
  thickness: '5px',
  transition: {
    speed: '0.2s',
    opacity: '0.6s',
    termination: 300
  },
  autoRevert: true,
  location: 'top',
  inverse: false
}
Vue.use(VueProgressBar, options)

const Toast = Swal.mixin({
  toast: true,
  position: 'top-end',
  showConfirmButton: false,
  timer: 3000
})
window.Toast = Toast

// Define a event for me
window.Fire = new Vue()

const router = new VueRouter({
  // mode: 'history',
  routes
})

const app = new Vue({
  el: '#app',
  router
})
