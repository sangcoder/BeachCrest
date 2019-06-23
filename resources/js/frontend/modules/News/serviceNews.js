import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getNewsById (id) {
    return Axios.get(APP_CONFIG.API_URL + '/news/getbyId/' + id)
  },
  getListPromotion () {
    return Axios.get(APP_CONFIG.API_URL + '/tour/getAll', {params: {type: 'promotion'}})
  }
}
