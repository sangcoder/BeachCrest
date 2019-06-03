import {APP_CONFIG} from '../config'
import Axios from 'axios'

export default {
  registerMember (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/auth/register', payload)
  },
  checkUnique (email) {
    return Axios.post(APP_CONFIG.API_URL + '/auth/checkUnique', email)
  }
}
