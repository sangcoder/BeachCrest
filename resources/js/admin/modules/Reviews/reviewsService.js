import {APP_CONFIG} from '../../../config'
import Axios from 'axios'

export default {
  getListReview (page = 1, params = {}) {
    return Axios.get(APP_CONFIG.API_URL + '/review/getAll?page=' + page, {
      params
    })
  },
  deleteReview (id) {
    return Axios.delete(APP_CONFIG.API_URL + '/review/deleleReview/' + id)
  },
  acceptReview (id, payload) {
    return Axios.post(APP_CONFIG.API_URL + '/review/acceptReview/' + id, payload)
  },
  getReviewByTour (id) {
    return Axios.get(APP_CONFIG.API_URL + '/review/getReviewById/' + id)
  }
}
