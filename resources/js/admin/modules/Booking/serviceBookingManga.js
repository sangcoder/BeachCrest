import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListBooking (page = 1, params = {}) {
    return Axios.get(APP_CONFIG.API_URL + '/booking?page=' + page)
  },
  getCustomerBooking (id) {
    return Axios.get(APP_CONFIG.API_URL + '/booking/' + id)
  },
  getDelegateBooking (id) {
    return Axios.get(APP_CONFIG.API_URL + '/booking/' + id, {
      params: {delegate: true}
    })
  }
}
