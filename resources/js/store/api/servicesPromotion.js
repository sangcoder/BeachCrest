import {APP_CONFIG} from '../../config'
import Axios from 'axios'

export default {
  getListPromotion: function (page = 1) {
    return Axios.get(APP_CONFIG.API_URL + '/promotion?page=' + page)
  }
}
