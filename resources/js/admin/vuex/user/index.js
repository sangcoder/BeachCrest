import actions from './actions'
import mutations from './mutations'
import getters from './getters'

export default {
  namespaced: true,
  state: {
    dsUser: [],
    user: null,
    userLoadStatus: 0
  },
  getters,
  mutations,
  actions
}
