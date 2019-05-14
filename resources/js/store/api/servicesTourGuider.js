import {APP_CONFIG} from '../../config'
import Axios from 'axios'

export default {
  getListGuider: function (page = 1) {
    return Axios.get(APP_CONFIG.API_URL + '/tourguider?page=' + page)
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
