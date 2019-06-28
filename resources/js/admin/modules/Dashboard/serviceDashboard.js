import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getstatBooking () {
    return Axios.get(APP_CONFIG.API_URL + '/dashboard/member')
  },
  getBookingAdmin () {
    return Axios.get(APP_CONFIG.API_URL + '/dashboard/admin')
  }
}
