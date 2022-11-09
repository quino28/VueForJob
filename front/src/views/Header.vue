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
</template>

<script>
export default {
  methods: {
    changeComponent(component) {
      this.$emit('changeComponent', component)
    },
    logout() {
      this.$store.commit('removeMember')
      /* go to home */
    },
  }
}
</script>

<style lang="scss">
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
</style>
