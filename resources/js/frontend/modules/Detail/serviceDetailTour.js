import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getTourId (id) {
    return Axios.get(APP_CONFIG.API_URL + '/tour/getById/' + id)
  }
}