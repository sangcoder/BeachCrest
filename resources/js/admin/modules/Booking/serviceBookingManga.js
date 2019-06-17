import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListBooking (page = 1, params = {}) {
    return Axios.get(APP_CONFIG.API_URL + '/booking?page=' + page, {
      params
    })
  },
  getCustomerBooking (id) {
    return Axios.get(APP_CONFIG.API_URL + '/booking/' + id)
  },
  getDelegateBooking (id, params = {}) {
    return Axios.get(APP_CONFIG.API_URL + '/booking/' + id, {
      params
    })
  },
  getStat () {
    return Axios.get(APP_CONFIG.API_URL + '/bookingStats')
  },
  acceptBooking (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/booking/acceptBooking', payload)
  },
  deleteBooking (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/booking/' + id)
  }
}
