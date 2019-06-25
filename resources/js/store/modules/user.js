import { defaultMutations } from 'vuex-easy-access'
import UserAPI from '../api/user'
import AuthAPI from '../api/auth'

const state = {
  user: null,
  userLoadStatus: 0,
  dsUser: []
}

// add generate mutation vuex easy access
// https://mesqueeb.github.io/vuex-easy-access/setup.html#setup
const mutations = { ...defaultMutations(state) }

const getters = {
  getUser: state => () => state.user,
  getUserLoadStatus: state => () => state.userLoadStatus,
  getDsUser: state => () => state.dsUser
}

const actions = {
  getUser ({ commit }) {
    commit('userLoadStatus', 1)
    UserAPI.getUser()
    .then((response) => {
      commit('userLoadStatus', 2)
      commit('user', response.data.data)
    })
    .catch(function (e) {
      commit('userLoadStatus', 3)
      commit('user', {})
    })
  },

  logout ({ commit }) {
    commit('userLoadStatus', 0)
    commit('user', null)
  },

  login ({ commit }, credential) {
    commit('userLoadStatus', 1)
    return new Promise((resolve, reject) => {
      AuthAPI.getAccessToken(credential.email, credential.password)
      .then((response) => {
        commit('userLoadStatus', 2)
        commit('user', response.data.data)
        // Return successful response
        resolve(response)
      })
      .catch((error) => {
        commit('userLoadStatus', 3)
        commit('user', {})
        // Return error
        reject(error)
      })
    })
  },
  getDsUser ({commit}, payload) {
    return new Promise((resolve, reject) => {
      UserAPI.getDsUser(payload.page, payload.params)
      .then((response) => {
        commit('dsUser', response.data.data)
        resolve(response)
      })
      .catch((err) => {
        reject(err)
      })
    })
  }
}

export default {
  state,
  mutations,
  actions,
  getters
}
