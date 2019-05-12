import {APP_CONFIG} from '../../config'
import Axios from 'axios'

export default {
  getListPromotion: function (page = 1) {
    return Axios.get(APP_CONFIG.API_URL + '/promotion?page=' + page)
  },
  addPromotion: function (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/promotion', payload)
  },
  updatePromotion: function (id, payload) {
    return Axios.put(APP_CONFIG.API_URL + '/promotion/' + id, payload)
  },
  deletePromotion: function (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/promotion/' + id)
  }
}
