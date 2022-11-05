<template>
  <component
  :is="currentComponent"
  @setMember="setMember"
  />
</template>

<script>
import DogApi from '../components/Body/DogApi.vue'
import Login from '../components/Body/Login.vue'

export default {
  components: {
    DogApi,
    Login,
  },
  props: [
    "currentComponent",
  ],
  data() {
    return {
      member: '',
    }
  },
  methods: {
    setMember(member) {
      this.member = member
    },
  }
}
</script>
