<template>
  <div style="padding: 40px 20px 20px">
    <h1>Are you members?</h1>
  </div>
  {{ text }}
  <div class="container" style="padding: 20px 20px">
    <div class="mb-3 row">
      <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" placeholder="Email">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="password" class="col-sm-2 col-form-label">Password</label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="password" placeholder="Password">
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
import axios from 'axios'

export default {
  data() {
    return {
      form: {
        email: '',
        password: '',
      },
      text: '',
    }
  },
  methods: {
    /* temporary */
    login() {
      axios.post('http://localhost:4000/api/login')
      .then(res => {
        this.text = res.data
      }).catch(err => {
        console.error(err)
      })
    }
  }
}
</script>
