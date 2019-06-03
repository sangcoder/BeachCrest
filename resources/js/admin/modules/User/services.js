import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  deleteUser (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/user/' + id)
  },
  getlistUser (page = 1, params) {
    return Axios.get(APP_CONFIG.API_URL + '/user?page=' + page, {
      params
    })
  },
  addRoleModel (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/user/addRoleModel', payload)
  },
  getAllRole () {
    return Axios.get(APP_CONFIG.API_URL + '/roles/getAll')
  }
}
