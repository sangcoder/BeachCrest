export default {
  getUser: state => () => state.user,
  getUserLoadStatus: state => () => state.userLoadStatus
}
