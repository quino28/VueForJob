<template>
  <div class="logo">
    <router-link to="/">
      <img src="/logo.png" alt="Quino's demo">
    </router-link>
  </div>
  <div class="header">
    <ul>
      <li>News</li>
      <li>Profile</li>
      <li>Schedule</li>
      <li>Shop</li>
      <li>Ticket</li>
      <li><router-link to="/dogapi">Dog API</router-link></li>
      <li v-if="$store.state.member">Ticket</li>
      <div v-if="!$store.state.member">
        <b-button variant="outline-light"><router-link to="/sign_in">Sign In</router-link></b-button>
      </div>
      <div v-else>
        <font-awesome-icon icon="fa-solid fa-user" />
        <b-button variant="outline-light" @click="logout">Logout</b-button>
      </div>
    </ul>
  </div>
  <router-view />
  <div class="footer">
    <p>made by quino</p>
    <p>
      email: <a href="mailto:quinolactacin@gmail.com">quinolactacin@gmail.com</a>
    </p>
  </div>
</template>

<script>
export default {
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
  div {
    display: inline-block;
    svg {
      cursor: pointer;
      margin-left: 30px;
    }
    button {
      margin-left: 30px;
    }
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
