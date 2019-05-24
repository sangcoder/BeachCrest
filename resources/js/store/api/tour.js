import {APP_CONFIG} from '../../config'
import Axios from 'axios'

export default {
  getListTour: function (page = 1) {
    return Axios.get(APP_CONFIG.API_URL + '/tour/getAll?page=', page)
  }
}
