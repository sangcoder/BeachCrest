import './bootstrap'

import Vue from 'vue'

import BootstrapVue from 'bootstrap-vue'
import wysiwyg from 'vue-wysiwyg'
import VueProgressBar from 'vue-progressbar'
import { Form, HasError, AlertError } from 'vform'

import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'

import * as filters from './filters'
// import GlobalComponents from './globalComponents'
// Routers
import router from './router/index.js'
// Vuex
import store from './store/index.js'

var VueTruncate = require('vue-truncate-filter')

window.Vue = Vue
Vue.component(HasError.name, HasError)
Vue.component(AlertError.name, AlertError)

window.Form = Form
// Vue.use(GlobalComponents)
Vue.use(VueTruncate)
Vue.use(ElementUI)
Vue.use(BootstrapVue)
Vue.use(wysiwyg, {
  image: {
    uploadURL: '/api/uploadImage'
  },
  maxHeight: '500px',
  forcePlainTextOnPaste: true
})
// Global ulti
Object.keys(filters).forEach(key => {
  Vue.filter(key, filters[key])
})
// Progress bar
const options = {
  color: '#bffaf3',
  failedColor: '#874b4b',
  thickness: '2px',
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

// Define a event for me
window.Fire = new Vue()
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store
})
