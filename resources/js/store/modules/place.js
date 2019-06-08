import { defaultMutations } from 'vuex-easy-access'
import PlaceAPI from '../api/servicesPlace'
const state = {
  listPlace: [],
  placeInfo: {}
}

const mutations = {
  ...defaultMutations(state),
  DELETE_PLACE (state, id) {
    let listPlace = state.listPlace.filter(item => item.PlaceID !== id)
    state.listPlace = listPlace
  },
  UPDATE_PROMOTION (state, payload) {
    state.listPlace = state.listPlace.map((item) => {
      if (item.PlaceID === payload.PlaceID) {
        return Object.assign({}, item, payload)
      }
      return item
    })
  }
}

const getters = {
  getListPlace: state => () => state.listPlace
}

const actions = {
  getListPlace ({commit}, page) {
    return new Promise((resolve, reject) => {
      PlaceAPI.getListPlace(page)
      .then((response) => {
        commit('listPlace', response.data.data.data)
        resolve(response)
      })
      .catch((err) => {
        reject(err)
      })
    })
  },
  GetPlaceById ({commit}, id) {
    return new Promise((resolve, reject) => {
      PlaceAPI.GetPlaceById(id)
      .then((response) => {
        commit('placeInfo', response.data)
        resolve(response)
      })
      .catch((err) => {
        reject(err)
      })
    })
  },
  addPlace ({commit}, payload) {
    return new Promise((resolve, reject) => {
      let placeInfo = {
        PlaceName: payload.PlaceName,
        Description: payload.Description,
        ImageUrl: payload.ImageUrl,
        Contents: payload.Contents,
        Region: payload.Region
      }
      PlaceAPI.addPlace(placeInfo).then((res) => {
        commit('listPlace', res.data.data)
        resolve(res)
      })
      .catch(err => {
        reject(err)
      })
    })
  },
  updatePlace ({commit}, payload) {
    return new Promise((resolve, reject) => {
      let PlaceInfo = {
        PlaceName: payload.PlaceName,
        Description: payload.Description,
        ImageUrl: payload.ImageUrl,
        Contents: payload.Contents,
        Region: payload.Region
      }
      PlaceAPI.updatePlace(payload.id, PlaceInfo).then((res) => {
        // console.log(res.data.data)
        commit('UPDATE_PROMOTION', res.data.data)
        resolve(res)
      })
      .catch(err => {
        console.log('error' + err)
      })
    })
  },
  deletePlace ({ commit }, id) {
    return new Promise((resolve, reject) => {
      PlaceAPI.deletePlace(id).then((res) => {
        commit('DELETE_PLACE', id)
        resolve(res)
      })
      .catch(err => {
        console.log('error: ' + err)
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
