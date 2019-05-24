import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListSchedules (page = 1, params = {}) {
    return Axios.get(APP_CONFIG.API_URL + '/schedules/getAll?page=' + page)
  }
}
