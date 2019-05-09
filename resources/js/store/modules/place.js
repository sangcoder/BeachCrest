import { defaultMutations } from 'vuex-easy-access'
import PlaceAPI from '../api/place'
const state = {
  listPlace: [],
  placeInfo: {}
}

const mutations = { ...defaultMutations(state) }

const getters = {
  getListPlace: state => () => state.listPlace
}

const actions = {
  getListPlace ({commit}, page) {
    return new Promise((resolve, reject) => {
      PlaceAPI.getListPlace(page)
      .then((response) => {
        commit('listPlace', response.data.data)
        resolve(response)
        return response
      })
      .catch((err) => {
        reject(err)
      })
    })
  },
  GetPlaceById ({commit},id) {
    return new Promise((resolve, reject) => {
      PlaceAPI.GetPlaceById(id)
      .then((response) => {
        commit('placeInfo', response.data)
        resolve(response)
        return response
      })
      .catch((err) => {
        reject(err)
      })
    }) 
  },
  updatePlace({commit}, payload) {
    return new Promise((resolve, reject) => {
      let PlaceInfo = {
        PlaceName: payload.PlaceName,
        Description: payload.Description,
        ImageUrl: payload.ImageUrl,
        Contents: payload.Contents, 
        Region: payload.Region
      }
      PlaceAPI.updatePlace(payload.id,PlaceInfo).then((res) => {
        console.log(res.data.data)
        commit('listPlace', res.data.data)
        resolve(res)
      })
      .catch(err => {
        console.log('error' + err)
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
