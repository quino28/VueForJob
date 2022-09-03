<template>
  <component :is="currentComponent" />
</template>

<script>
import Login from '../components/Body/Login.vue'
import DogApi from '../components/Body/DogApi.vue'

export default {
  components: {
    Login,
    DogApi,
  },
  props: [
    "currentComponent",
  ],
}
</script>
