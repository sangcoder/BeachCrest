import AuthApi from '../../api/auth.js'

const login = async (context, payload) => {
  context.commit('userLoadStatus', 1)
  try {
    let {data} = await AuthApi.getAccessToken(payload.email, payload.password)
    if (data.success === true) {
      context.commit('userLoadStatus', 2)
      context.commit('getUser', data.data)
    }
    return data.success
  } catch (err) {
    return err
  }
}

const getDsUser = async (context, data) => {
  try {
    let {data} = await AuthApi.getDsUser()
    context.commit('getDsUser', data.data)
  } catch (err) {
    return err
  }
}
export default {
  login,
  getDsUser
}
