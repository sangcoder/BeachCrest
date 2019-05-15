import {APP_CONFIG} from '../../config'
import Axios from 'axios'
import qs from 'qs'

export default {
  getListGuider: function (page = 1, params = {}) {
    console.log('ao' + JSON.stringify(params))
    let listGuider = Axios.create({
      paramsSerializer: params => qs.stringify(params, {arrayFormat: 'comma'})
    })
    return listGuider.get(APP_CONFIG.API_URL + '/tourguider?page=' + page, {
      params
    })
  },
  addGuider: function (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/tourguider', payload)
  },
  updateGuider: function (id, payload) {
    return Axios.put(APP_CONFIG.API_URL + '/tourguider/' + id, payload)
  },
  deleteGuider: function (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/tourguider/' + id)
  }
}
