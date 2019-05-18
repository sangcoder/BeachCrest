import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getAllRole () {
    return Axios.get(APP_CONFIG.API_URL + '/roles/getAll')
  },
  getAllPermission () {
    return Axios.get(APP_CONFIG.API_URL + '/permission/getAll')
  },
  getAllPermisionById (id) {
    return Axios.get(APP_CONFIG.API_URL + '/permission/getAllPermission/' + id)
  }
}
