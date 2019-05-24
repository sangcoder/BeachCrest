import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListSchedules (page = 1, params = {}) {
    return Axios.get(APP_CONFIG.API_URL + '/schedules/getAll?page=' + page)
  },
  addSchedule (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/schedules/addNew', payload)
  },
  updateSchedule (id, payload) {
    return Axios.put(APP_CONFIG.API_URL + '/schedules/updateSchedule/' + id, payload)
  },
  deleteSchedule (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/schedules/deleteSchedule/' + id)
  },
  getGuider () {
    return Axios.get(APP_CONFIG.API_URL + '/tourguider?type=all')
  },
  getListGuiderById (id) {
    return Axios.get(APP_CONFIG.API_URL + '/schedules/getListGuider/' + id)
  },
  addGuiderToSchedule (idGuider, payload) {
    return Axios.post(APP_CONFIG.API_URL + '/schedules/addGuiderToSchedule/' + idGuider, payload)
  },
  deleteGuiderToSchedule (idSchedule, payload) {
    return Axios.post(APP_CONFIG.API_URL + '/schedules/deleteGuiderToSchedule/' + idSchedule, payload)
  }
}
