import {defaultMutations} from 'vuex-easy-access'
import PromotionAPI from '../api/servicesPromotion'
import { Promise } from 'es6-promise'
const state = {
  listPromtion: []
}

const mutations = {
  ...defaultMutations(state),
  ADD_PROMOTION (state, promotion) {
    state.listPromtion = [...state.listPromtion, ...[promotion]]
  },
  DELETE_PROMOTION (state, id) {
    let listPromotion = state.listPromtion.filter(item => item.PromotionID !== id)
    state.listPromtion = listPromotion
  },
  UPDATE_PROMOTION (state, payload) {
    console.log('vaoday')
    let a = state.listPromtion.filter((item) => {
      console.log('1')
      return item.PromotionID !== payload.PromotionID
    })
    state.listPromtion = [...a, payload]
  }
}

const getters = {
  listPromtion: state => () => state.listPromtion
}

const actions = {
  getListProMotion ({commit}, page) {
    return new Promise((resolve, reject) => {
      PromotionAPI.getListPromotion(page).then((res) => {
        commit('listPromtion', res.data.data.data)
        resolve(res)
      })
      .catch(err => {
        reject(err)
      })
    })
  },
  addPromotion ({commit}, payload) {
    return new Promise((resolve, reject) => {
      let promotionInfo = {
        Contents: payload.Contents
      }
      PromotionAPI.addPromotion(promotionInfo).then(res => {
        commit('ADD_PROMOTION', res.data.data)
        resolve(res)
      })
      .catch(err => {
        reject(err)
      })
    })
  },
  updatePromotion ({commit}, payload) {
    let promotionInfo = {
      Contents: payload.Contents
    }
    return new Promise((resolve, reject) => {
      PromotionAPI.updatePromotion(payload.PromotionID, promotionInfo).then(res => {
        commit('UPDATE_PROMOTION', res.data.data)
        resolve(res)
      })
      .catch(err => {
        reject(err)
      })
    })
  },
  deletePromotion ({commit}, id) {
    return new Promise((resolve, reject) => {
      PromotionAPI.deletePromotion(id).then(res => {
        commit('DELETE_PROMOTION', id)
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
