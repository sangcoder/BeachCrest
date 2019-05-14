import {defaultMutations} from 'vuex-easy-access'
import { Promise } from 'es6-promise'

import GuiderAPI from '../api/servicesTourGuider'
import { async } from 'q';

const state = {
  listGuiders: []
}

const mutations = {
  ...defaultMutations(state),
  ADD_PROMOTION (state, guider) {
    state.listGuiders = [...state.listGuiders, ...[guider]]
  },
  DELETE_PROMOTION (state, id) {
    let listGuiders = state.listGuiders.filter(item => item.GuiderID !== id)
    state.listGuiders = listGuiders
  },
  UPDATE_PROMOTION (state, payload) {
    let guiders = state.listGuiders.filter((item) => {
      return item.GuiderID !== payload.GuiderID
    })
    state.listGuiders = [...guiders, payload]
  }
}

const getters = {
  listGuiders: state => () => state.listGuiders
}

const actions = {
  getListGuider ({commit}, page) {
    return new Promise((resolve, reject) => {
      GuiderAPI.getListGuider(page).then(res => {
        commit('listGuiders', res.data.data.data)
        resolve(res)
      })
      .catch(err => {
        reject(err)
      })
    })
  },
  addGuider: async ({commit}, payload) => {
    try {
      let res = await GuiderAPI.addGuider(payload)
      commit('ADD_PROMOTION', res.data.data)
      return res
    } catch (err) {
      return err
    }
  },
  updateGuider: async ({commit}, payload) => {
    try {
      let guiderInfo = {
        GuiderName: payload.GuiderName,
        Birthday: payload.Birthday,
        Address: payload.Address,
        PhoneNumner: payload.PhoneNumner,
        ImgUrl: payload.ImgUrl,
        Gender: payload.Gender
      }
      let res = await GuiderAPI.updateGuider(payload.GuiderID, guiderInfo)
      commit('UPDATE_PROMOTION', res.data.data)
      return res
    } catch (err) {
      return err
    }
  },
  deleteGuider: async ({commit}, id) => {
    try {
      let data = await GuiderAPI.deleteGuider(id)
      commit('DELETE_PROMOTION', id)
      return data
    } catch (err) {
      return err
    }
  }
}
export default {
  state,
  mutations,
  getters,
  actions
}
