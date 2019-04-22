const getUser = (state, data) => {
  state.user = data
  state.userLoadStatus = 1
}

const getDsUser = (state, data) => {
  state.dsUser = data
}
export default {
  getUser,
  getDsUser
}
