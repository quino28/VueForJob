<template>
  <component
  :is="currentComponent"
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
}
</script>
