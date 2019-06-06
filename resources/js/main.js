import './bootstrap'

import Vue from 'vue'

import Antd from 'ant-design-vue'
import wysiwyg from 'vue-wysiwyg'
import BootstrapVue from 'bootstrap-vue'
import Vuelidate from 'vuelidate'
import 'ant-design-vue/dist/antd.css'
import 'nprogress/nprogress.css'
import * as filters from './filters'
import Editor from '@tinymce/tinymce-vue'
// import tinymce from 'tinymce/tinymce'
// import 'tinymce/themes/modern/theme'
// import 'tinymce/plugins/advlist'
// import 'tinymce/plugins/autolink'
// import 'tinymce/plugins/lists'
// import 'tinymce/plugins/link'
// import 'tinymce/plugins/image'
// import 'tinymce/plugins/charmap'
// import 'tinymce/plugins/preview'
// import 'tinymce/plugins/hr'
// import 'tinymce/plugins/searchreplace'
// import 'tinymce/plugins/wordcount'
// import 'tinymce/plugins/code'
// import 'tinymce/plugins/fullscreen'
// import 'tinymce/plugins/table'
// import 'tinymce/plugins/contextmenu'
// import 'tinymce/plugins/paste'
// import 'tinymce/plugins/textcolor'
// import 'tinymce/plugins/colorpicker'
// import GlobalComponents from './globalComponents'
// Routers
import router from './router/index.js'
// Vuex
import store from './store/index.js'

var VueTruncate = require('vue-truncate-filter')

Vue.component('editor', Editor)
window.Vue = Vue

// Vue.use(GlobalComponents)
Vue.use(VueTruncate)
Vue.use(Antd)
Vue.use(BootstrapVue)
Vue.use(Vuelidate)

// Editor
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

// Define a event for me
window.Fire = new Vue()
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store
})
