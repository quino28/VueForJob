import { createStore } from 'vuex'

export default createStore({
  state: {
    member : {},
  },
  actions: {
    setMember(state, member) {
      console.log(member)
      state.member = member
    },
    removeMember(state) {
      state.member = {}
    },
  },
})
