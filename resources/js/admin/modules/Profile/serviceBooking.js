import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getHistoryBooking (page = 1) {
    return Axios.get(APP_CONFIG.API_URL + '/historybooking/member?page=' + page)
  }
}
