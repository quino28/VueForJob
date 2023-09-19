<template>
  <div style="padding: 40px 20px 20px">
    <h1>Are you members?</h1>
  </div>
  <div v-if="this.error.message.length">
    <h1 class="error">{{ this.error.message }}</h1>
  </div>
  <div class="container" style="padding: 20px">
    <div class="mb-3 row">
      <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" v-model="this.form.email" placeholder="Email">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="password" class="col-sm-2 col-form-label">Password</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="password" v-model="this.form.password" placeholder="Password">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="password" class="col-sm-2 col-form-label"></label>
      <div class="col-sm-10" style="text-align: left">
        <button class="btn btn-primary" @click="login">Login</button>
      </div>
    </div>
  </div>
  <div style="padding: 0px 20px 20px">
    <h1>If you are still not members and want to be.</h1>
    <p><router-link to="/sign_up">Sign Up</router-link></p>
  </div>
</template>

<script>
export default {
  data() {
    return {
      error: {
        message: '',
      },
      form: {
        email: '',
        password: '',
      },
    }
  },
  created() {
    if (this.$store.state.cookies.get('member')) {
      this.$router.push('/')
    }
  },
  methods: {
    login() {
      this.$axios.post('/api/sign_in', {
        form: this.form,
      })
      .then(res => {
        if (res && res.data) {
          this.$store.commit('setMember', res.data.member)
          /* TODO: go to page for member */
          this.$router.push('/')
        } else {
          this.error.message = 'Something is wrong.'
        }
      }).catch(err => {
        console.error(err)
      })
    }
  }
}
</script>

<style lang="scss">
.error {
  color: #DD4C70;
}
</style>
