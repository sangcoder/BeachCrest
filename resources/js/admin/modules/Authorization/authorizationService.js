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
  },
  addPermissioToRole (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/permission/addPermissionToRole', payload)
  },
  addNewRole (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/roles/addNewRole', payload)
  },
  deleteRole (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/role/DeleteRole/' + id)
  }
}
