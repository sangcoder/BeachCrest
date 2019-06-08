import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListPlace () {
    return Axios.get(APP_CONFIG.API_URL + '/place/getSelect')
  },
  findTour (params) {
    return Axios.get(APP_CONFIG.API_URL + '/tour/findAndFilter', {
      params
    })
  }
}
