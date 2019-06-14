import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getTourById (id) {
    return Axios.get(APP_CONFIG.API_URL + '/tour/getById/' + id)
  },
  addBooking (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/booking/addNewBooking', payload)
  },
  bookingPaypal (params) {
    return Axios.get(APP_CONFIG.URL_APP + '/checkout/paypal', {params})
  },
  checkOutPaypal (data) {
    return Axios.post(APP_CONFIG.URL_APP + '/checkout-paypal', data)
  }
}
