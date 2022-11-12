<template>
  <div class="logo">
    <img src="/logo.png" alt="Quino's demo">
  </div>
  <div class="header">
    <ul>
      <li>News</li>
      <li>Profile</li>
      <li>Schedule</li>
      <li>Shop</li>
      <li>Ticket</li>
      <li @click="changeComponent('DogApi')">Dog API</li>
      <li v-if="$store.state.member">Ticket</li>
      <b-button variant="outline-light" @click="changeComponent('login')" v-if="!$store.state.member">Login</b-button>
      <b-button variant="outline-light" @click="logout" v-else>Logout</b-button>
    </ul>
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

.logo {
  background-color: #38b48b;
  img {
    width: 8em;
    cursor: pointer;
  }
}

.header {
  background-color: #38b48b;
  color: #fef4f4;
  padding: 0px 10px 20px;
  display: block;
  align-items: center;
  ul {
    li {
      display: inline-block;
      margin: 10px;
      cursor: pointer;
    }
  }
  button {
    margin-left: 50px;
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
