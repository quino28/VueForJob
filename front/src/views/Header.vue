<template>
  <div class="header">
    <ul>
      <li>News</li>
      <li>Profile</li>
      <li>Fun Club</li>
      <li>Dog API</li>
    </ul>
    <b-button variant="outline-light" @click="changeComponent('login')">Login</b-button>
  </div>
</template>

<script>
export default {
  methods: {
    changeComponent(component) {
      this.$emit('changeComponent', component)
    }
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
