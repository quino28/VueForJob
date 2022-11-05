<template>
  <div style="padding: 40px 20px 20px">
    <h1>Are you members?</h1>
  </div>
  <div>
    <h1>{{ this.error.message }}</h1>
  </div>
  <div class="container" style="padding: 20px 20px">
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
  methods: {
    login() {
      this.$axios.post('/api/login', {
        form: this.form,
      })
      .then(res => {
        if (res && res.data) {
          this.$emit('setMember', res.data.member)
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
