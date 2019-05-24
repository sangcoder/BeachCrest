import {defaultMutations} from 'vuex-easy-access'
import TourAPI from '../api/tour'

const state = {
  listTour: []
}

const mutations = {
  ...defaultMutations(state)
}

const getters = {
  getListTour: state => () => state.listTour
}

const actions = {
  getListTour ({commit}, page) {
    return new Promise((resolve, reject) => {
      TourAPI.getListTour(page)
        .then(res => {
          let temp = res.data.data
          temp.forEach(ele => {
            if (ele.ImageUrl) {
              let tmp = JSON.parse(ele.ImageUrl)
              ele.ImageUrl = tmp
            }
          })
          commit('listTour', temp)
          resolve(res)
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
  getters,
  actions
}
