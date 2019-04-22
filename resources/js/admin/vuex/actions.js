import { APP_CONFIG } from '../../config'
import UserAPI  from '../api/user'
import AuthAPI from '../api/auth'

const getUser = async (context) => {
  context.commit('userLoadStatus', 1)
  UserAPI.getUser().then((response) => {
    context.commit('userLoadStatus', 2)
    const { data } = response.data
    context.commit('user', data)
  })
  .catch((e) => {
    context.commit('userLoadStatus', 3)
    context.commit('user', {})
  })
}

const logout = async (context) => {
  context.commit('userloadStatus', 1)
  context.commit('user', null)
}

// const login = async (context, payload) => {
//   context.commit('userLoadStatus', 1)
// }
export default {
  getUser,
  logout
}
