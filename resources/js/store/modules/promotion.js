import {defaultMutations} from 'vuex-easy-access'
import PromotionAPI from '../api/servicesPromotion'
import { Promise } from 'es6-promise'
const state = {
  listPromtion: []
}

const mutations = {
  ...defaultMutations(state),
  ADD_PROMOTION (state, promotion) {
    state.listPromtion = [...[promotion], ...state.listPromtion]
  },
  DELETE_PROMOTION (state, id) {
    let listPromotion = state.listPromtion.filter(item => item.PromotionID !== id)
    state.listPromtion = listPromotion
  },
  UPDATE_PROMOTION (state, payload) {
    state.listPromtion = state.listPromtion.map((item) => {
      if (item.PromotionID === payload.PromotionID) {
        return Object.assign({}, item, payload)
      }
      return item
    })
  }
}

const getters = {
  listPromtion: state => () => state.listPromtion
}

const actions = {
  getListProMotion ({commit}, payload) {
    return new Promise((resolve, reject) => {
      PromotionAPI.getListPromotion(payload.page, payload.params).then((res) => {
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
