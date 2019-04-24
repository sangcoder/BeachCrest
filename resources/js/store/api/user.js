import {APP_CONFIG} from '../../config'
import Axios from 'axios'

export default {
  /*
    GET /api/getUser
    get thông tin user
  */
  getUser: function () {
    return Axios.get(APP_CONFIG.API_URL + '/auth/getUser')
  }
}
