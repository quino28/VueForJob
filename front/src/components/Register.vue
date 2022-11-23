<template>
  <div style="padding: 40px 20px 20px">
    <h1>Please type your infomations.</h1>
  </div>
  <div>
    <h1>{{ this.error.message }}</h1>
  </div>
  <div class="container" style="padding: 20px 20px">
    <div class="mb-3 row">
      <label for="name" class="col-sm-2 col-form-label">Name</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" v-model="this.form.name" placeholder="Name">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="gender" class="col-sm-2 col-form-label">Gender</label>
      <div class="col-sm-10">
        <div class="form-check form-check-inline">
          <input type="radio" class="form-check-input" id="gender" v-model="this.form.gender" value="0">
          <label class="form-check-label" for="male">Male</label>
        </div>
        <div class="form-check form-check-inline">
          <input type="radio" class="form-check-input" id="gender" v-model="this.form.gender" value="1">
          <label class="form-check-label" for="female">Female</label>
        </div>
        <div class="form-check form-check-inline">
          <input type="radio" class="form-check-input" id="gender" v-model="this.form.gender" value="2">
          <label class="form-check-label" for="others">Others</label>
        </div>
      </div>
    </div>
    <div class="mb-3 row">
      <label for="address" class="col-sm-2 col-form-label">Address</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="address" v-model="this.form.address" placeholder="Address">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="email" class="col-sm-2 col-form-label">Email</label>
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
      <label for="password_confirm" class="col-sm-2 col-form-label">Password confirm</label>
      <div class="col-sm-10">
        <input type="password_confirm" class="form-control" id="password_confirm" v-model="this.form.password_confirm" placeholder="Password again">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="password" class="col-sm-2 col-form-label"></label>
      <div class="col-sm-10 test" style="text-align: left">
        <button class="btn btn-secondary"><router-link to="/sign_in">Back</router-link></button>
        <button class="btn btn-primary" @click="register">Go</button>
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
        name: '',
        gender: '0',
        address: '',
        email: '',
        birthday: '',
        password: '',
        password_confirm: '',
      },
    }
  },
  methods: {
    register() {
      this.$axios.post('/api/register', {
        form: this.form,
      })
      .then(res => {
        if (res && res.data) {
          // Actions for succeess
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
.mb-3, .row {
  button {
    margin: 0.25rem 0.125rem;
  }
  .col-sm-10 {
    text-align: left;
  }
  .form-check-inline {
    vertical-align: sub;
    label {
      vertical-align: inherit;
    }
  }
}
</style>
