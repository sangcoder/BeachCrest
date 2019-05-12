import {defaultMutations} from 'vuex-easy-access'
import PromotionAPI from '../api/servicesPromotion'

const state = {
  listPromtion: []
}

const mutations = {
  ...defaultMutations(state)
}

const getters = {
  listPromtion: state => () => state.listPromtion
}

const actions = {
  getListProMotion ({commit}, page) {
    return new Promise((resolve, reject) => {
      PromotionAPI.getListPromotion(page).then((res) => {
        console.log('vao', res)
        commit('listPromtion', res.data.data.data)
        resolve(res)
      })
      .catch(err => {
        reject(err)
      })
    })
  }
}

export default {
  state,
  mutations,
  getters,
  actions
}
