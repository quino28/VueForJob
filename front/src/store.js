import { createStore } from 'vuex'

export default createStore({
  state: {
    member : null,
  },
  mutations: {
    setMember(state, member) {
      state.member = member
    },
    removeMember(state) {
      state.member = null
    },
  },
})
