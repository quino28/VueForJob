<template>
  <div class="header">
    <ul>
      <li>News</li>
      <li>Profile</li>
      <li>Fun Club</li>
      <li @click="changeComponent('DogApi')">Dog API</li>
    </ul>
    <b-button variant="outline-light" @click="changeComponent('login')" v-if="!$store.state.member">Login</b-button>
    <b-button variant="outline-light" @click="logout" v-else>Logout</b-button>
  </div>
  <Body
    :currentComponent="this.currentComponent"
  />
  <div class="footer">
    <p>made by quino</p>
    <p>
      email: <a href="mailto:quinolactacin@gmail.com">quinolactacin@gmail.com</a>
    </p>
  </div>
</template>

<script>
import Body from './views/Body.vue'

export default {
  components: {
    Body,
  },
  data() {
    return {
      currentComponent: 'home',
    }
  },
  methods: {
    changeComponent(component) {
      this.currentComponent = component
    },
    logout() {
      this.$store.commit('removeMember')
      this.currentComponent = 'home'
    },
  }
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

.header {
  background-color: #38b48b;
  color: #fef4f4;
  padding: 20px;
  display: flex;
  align-items: center;
  ul {
    li {
      display: inline;
      margin: 10px;
      cursor: pointer;
    }
  }
  button {
    margin-left: auto;
  }
}

.footer {
  background-color: #8b968d;
  color: #fef4f4;
  padding: 20px;
  font-size: 14px;
  a {
    color: inherit;
  }
}
</style>
