import { APP_CONFIG } from '../../config'
import Axios from 'axios'

const getAccessToken = (email, password) => {
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
  let data = await Axios.get(APP_CONFIG.API_URL + '/user')
  // console.log('data' + JSON.stringify(data))
  return data
}
export default {
  getAccessToken,
  logout,
  getDsUser
}
