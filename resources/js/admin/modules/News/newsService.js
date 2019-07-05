import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListNews (page = 1, params = {}) {
    return Axios.get(APP_CONFIG.API_URL + '/news?page=' + page)
  },
  getNewById (id) {
    return Axios.get(APP_CONFIG.API_URL + '/news/getbyId/' + id)
  },
  searchNews (keyword) {
    return Axios.get(APP_CONFIG.API_URL + '/news/search', {
      params: {
        keyword: keyword
      }
    })
  },
  addNews (payload) {
    return Axios.post(APP_CONFIG.API_URL + '/news', payload)
  },
  updateNews (id, payload) {
    return Axios.put(APP_CONFIG.API_URL + '/news/' + id, payload)
  },
  deleteNews (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/news/' + id)
  }
}
