import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  deleteUser (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/user/' + id)
  },
  getAllRole () {
    return Axios.get(APP_CONFIG.API_URL + '/roles/getAll')
  }
}
