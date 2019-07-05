import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getStactic (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/static/thongke', payload)
  }
}
