import {APP_CONFIG} from '../../config'
import Axios from 'axios'

export default {
  /*
  GET /api/place
  lay danh sach dia diem
  */
  getListPlace: function (page = 1) {
    return Axios.get(APP_CONFIG.API_URL + '/place?page=' + page)
  },
  GetPlaceById: function (id) {
    return Axios.get(APP_CONFIG.API_URL + '/place/'+ id)
  },
  updatePlace:  function (id, payload) {
    return Axios.put(APP_CONFIG.API_URL + '/place/' + id, payload)
  }
}
