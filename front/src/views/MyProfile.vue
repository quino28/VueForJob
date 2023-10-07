<template>
  <div class="container" style="padding: 20px" v-if="this.$store.state.member">
    <div class="mb-3 row">
      <label for="name" class="col-sm-4 col-form-label">Name</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control-plaintext" id="name" :value="this.$store.state.member.name">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="email" class="col-sm-4 col-form-label">Email</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control-plaintext" id="email" :value="this.$store.state.member.email">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="address" class="col-sm-4 col-form-label">Address</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control-plaintext" id="address" :value="this.$store.state.member.address ? this.$store.state.member.address : 'None'">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="gender" class="col-sm-4 col-form-label">gender</label>
      <div class="col-sm-8">
        <input type="text" readonly class="form-control-plaintext" id="gender" :value="this.constants['GENDER'][this.$store.state.member.gender]">
      </div>
    </div>
  </div>
</template>

<script>
import constants from '../assets/js/constants.js'

export default {
  data() {
    return {
      constants: constants,
    }
  },
  created() {
    if (!this.$store.state.member) {
      this.$router.push('/')
    }
  },
}
</script>

<style lang="scss" scoped>
.container {
  text-align: initial;
  label {
    font-weight: bold;
  }
}

@media (min-width: 992px) {
  .container {
    max-width: 720px;
  }
}
</style>
