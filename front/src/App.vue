<template>
  <Header
    @changeComponent="changeComponent"
  />
  <Body
    :currentComponent="this.currentComponent"
  />
  <Fotter />
</template>

<script>
import Header from './views/Header.vue'
import Body from './views/Body.vue'
import Fotter from './views/Fotter.vue'

export default {
  components: {
    Header,
    Body,
    Fotter,
  },
  data() {
    return {
      currentComponent: 'home',
    }
  },
  methods: {
    changeComponent(component) {
      this.currentComponent = component
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
