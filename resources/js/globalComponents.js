import Vue from 'vue'
import Loading from './admin/components/Loading.vue'
import Select from './admin/components/Select.vue'
import Switch from './admin/components/Switch.vue'

const GlobalComponents = {
  install (vue) {
    Vue.component(Loading.name, Loading)
    Vue.component(Select.name, Select)
    Vue.component(Switch.name, Switch)
  }
}

export default GlobalComponents
