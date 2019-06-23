import './bootstrap'

import Vue from 'vue'

import Antd from 'ant-design-vue'
import BootstrapVue from 'bootstrap-vue'
import Vuelidate from 'vuelidate'
import 'ant-design-vue/dist/antd.css'
import 'nprogress/nprogress.css'
import * as filters from './filters'
import Editor from '@tinymce/tinymce-vue'
import VueScrollTo from 'vue-scrollto'

// import GlobalComponents from './globalComponents'
// Routers
import router from './router/index.js'
// Vuex
import store from './store/index.js'

var VueTruncate = require('vue-truncate-filter')

Vue.component('editor', Editor)
window.Vue = Vue

// Vue.use(GlobalComponents)
Vue.use(VueScrollTo)
Vue.use(VueTruncate)
Vue.use(Antd)
Vue.use(BootstrapVue)
Vue.use(Vuelidate)

// Global ulti
Object.keys(filters).forEach(key => {
  Vue.filter(key, filters[key])
})

// Define a event for me
window.Fire = new Vue()
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store
})
