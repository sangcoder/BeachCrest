import { APP_CONFIG } from '../../config'
import Axios from 'axios'

const getAccessToken = (email, password) => {
  console.log('vao day1')
  let data = Axios.post(APP_CONFIG.API_URL + '/auth/login', {
    email: email,
    password: password
  })
  return data
}

const logout = function () {
  return Axios.get(APP_CONFIG.API_URL + '/auth/logout')
}

const getDsUser = async () => {
  let data = await Axios.get('api/user')
  return data
}
export default {
  getAccessToken,
  logout,
  getDsUser
}
