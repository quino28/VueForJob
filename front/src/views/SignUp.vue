<template>
  <div style="padding: 40px 20px 20px">
    <h1>Please type your infomations.</h1>
  </div>
  {{ this.validParams }}
  <div v-for="(message, index) in this.messages.error">
    <h1 class="error">{{ message }}</h1>
  </div>
  <div class="container">
    <div class="mb-3 row">
      <label for="name" class="col-sm-2 col-form-label">Name<span class="necessary">*</span></label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" v-model="this.form.name" placeholder="Name">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="gender" class="col-sm-2 col-form-label">Gender<span class="necessary">*</span></label>
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
      <label for="address" class="col-sm-2 col-form-label">Address<span class="necessary">*</span></label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="address" v-model="this.form.address" placeholder="Address">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="email" class="col-sm-2 col-form-label">Email<span class="necessary">*</span></label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" v-model="this.form.email" placeholder="Email">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="birthday" class="col-sm-2 col-form-label">Birthday</label>
      <div class="col-sm-10">
        <input type="date" class="form-control" id="birthday" v-model="this.form.birthday">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="password" class="col-sm-2 col-form-label">Password<span class="necessary">*</span></label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="password" v-model="this.form.password" placeholder="Password">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="password_confirm" class="col-sm-2 col-form-label">Password confirm<span class="necessary">*</span></label>
      <div class="col-sm-10">
        <input type="password" class="form-control" id="password_confirm" v-model="this.form.password_confirm" placeholder="Password again">
      </div>
    </div>
    <div class="mb-3 row">
      <label for="password" class="col-sm-2 col-form-label"></label>
      <div class="col-sm-10 test" style="text-align: left">
        <button class="btn btn-secondary"><router-link to="/sign_in">Back</router-link></button>
        <button class="btn btn-primary" @click="signUp">Go</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      messages: {
        error: [],
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
    signUp() {
      this.$axios.post('/api/sign_up', {
        form: this.form,
      })
      .then(res => {
        if (res && res.data) {
          // Actions for succeess
        } else {
          this.messages.error.push('Something is wrong.')
        }
      }).catch(err => {
        console.error(err)
      })
    },
    computed: {
      validParams () {
        const regex = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$/
        if (!regex.test(this.form.password)) {
          this.messages.error.push('Password must be between 8 and 100 alphanumeric characters')
          return false
        }
        return true
      },
    },
  },
}
</script>

<style lang="scss">
.container {
  padding: 20px 20px;
  .necessary {
    color: #DD4C70;
  }
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
}
.error {
  color: #DD4C70;
}
</style>
