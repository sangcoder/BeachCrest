import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListCultures (page = 1) {
    return Axios.get(APP_CONFIG.API_URL + '/cultures?page=' + page)
  }
}
