import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListTour (page = 1, params = {}) {
    return Axios.get(APP_CONFIG.API_URL + '/tour/getAll?page=' + page, {
      params
    })
  },
  addNewTour (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/tour/addNewTour', payload)
  },
  updateTour (id, payload) {
    return Axios.put(APP_CONFIG.API_URL + '/tour/updateTour/' + id, payload)
  },
  deleteTour (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/tour/deleteTour/' + id)
  },
  addPromotion (idTour, payload) {
    return Axios.post(APP_CONFIG.API_URL + '/tour/addPromotion/' + idTour, payload)
  },
  getScheduleById (id) {
    return Axios.get(APP_CONFIG.API_URL + '/schedules/getById?q=' + id)
  },
  getAllSchedule () {
    return Axios.get(APP_CONFIG.API_URL + '/schedules/getAll?type=all')
  },
  getListCulture () {
    return Axios.get(APP_CONFIG.API_URL + '/cultures/getAllSelect')
  }
}
