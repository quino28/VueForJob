import { createStore } from 'vuex'
import * as TinyCookie from 'tiny-cookie'

export default createStore({
  state: {
    member : null,
    acceptedCookie: false,
    cookies: TinyCookie,
  },
  mutations: {
    checkAcceptedCookie(state, status) {
      if (status === 'decline') {
        state.acceptedCookie = false
      } else {
        state.acceptedCookie = true
      }
    },
    setMember(state, member) {
      if (member) {
        state.member = member
        state.cookies.set('member', member, JSON.stringify)
      }
    },
    removeMember(state) {
      state.member = null
      state.cookies.remove('member')
    },
  },
})
