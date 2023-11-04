<template>
  <div v-for="message in this.messages.error">
    <h1 class="error">{{ message }}</h1>
  </div>
  <div class="container" style="padding: 20px" v-if="this.$store.state.member">
    <div class="alert alert-success" style="text-align: center;" role="alert" v-if="showSuccess">
      succeed!
    </div>
    <form @submit.prevent="submit">
      <div class="mb-3 row">
        <label for="name" class="col-sm-4 col-form-label">Name</label>
        <div class="col-sm-8">
          <input type="text" class="form-control" ref="name" id="name" :value="this.$store.state.member.name">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="email" class="col-sm-4 col-form-label">Email</label>
        <div class="col-sm-8">
          <input type="text" class="form-control" ref="email" id="email" :value="this.$store.state.member.email">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="address" class="col-sm-4 col-form-label">Address</label>
        <div class="col-sm-8">
          <input type="text" class="form-control" ref="address" id="address" :value="this.$store.state.member.address">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="gender" class="col-sm-4 col-form-label">Gender</label>
        <div class="col-sm-8">
          <div class="form-check form-check-inline" v-for="(value, key) in this.constants['GENDER']">
            <input type="radio" class="form-check-input" ref="gender" :id="'gender_' + key" name="gender" :value="key" :checked="Number(key) === this.$store.state.member.gender">
            <label class="form-check-label">{{ value }}</label>
          </div>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="birthday" class="col-sm-4 col-form-label">Birthday</label>
        <div class="col-sm-8">
          <input type="date" class="form-control" ref="birthday" id="birthday" :value="this.$store.state.member.birthday" disabled>
        </div>
      </div>
      <div class="mb-3 row">
        <label for="password" class="col-sm-4 col-form-label">Password</label>
        <div class="col-sm-8">
          <input type="password" class="form-control" ref="password" id="password" placeholder="Please put it in if you want to change">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="password_confirm" class="col-sm-4 col-form-label">Password confirm</label>
        <div class="col-sm-8">
          <input type="password" class="form-control" ref="password_confirm" id="password_confirm" placeholder="Password again">
        </div>
      </div>
      <div class="mb-3 row">
        <label for="password" class="col-sm-4 col-form-label"></label>
        <div class="col-sm-8">
          <button type="submit" class="btn btn-primary" @keyup.enter="submit">Update</button>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
import constants from '../assets/js/constants.js'
const targetList = ['name', 'email', 'address', 'gender', 'password']

export default {
  data() {
    return {
      constants: constants,
      messages: {
        error: [],
      },
      showSuccess: false,
    }
  },
  created() {
    if (!this.$store.state.member) {
      this.$router.push('/')
    }
  },
  methods: {
    submit() {
      this.messages.error = []
      this.showSuccess = false
      if (!this.checkParams()) return

      const params = {
        id: this.$store.state.member.id,
      }
      targetList.forEach(key => {
        if (key === 'gender') {
          this.$refs[key].forEach(el => {
            if (el.checked && Number(el.value) !== this.$store.state.member[key]) {
              params[key] = el.value
            }
          })
        } else {
          if (key === 'address' || this.$refs[key].value) {
            if (this.$refs[key].value !== this.$store.state.member[key]) {
              params[key] = this.$refs[key].value
              if (key === 'password') {
                params.ppassword_confirm = this.$refs.password_confirm.value
              }
            }
          }
        }
      })

      this.$axios.post('/api/member/update', {
        params: params,
      })
      .then(res => {
        if (res && res.data) {
          this.$store.commit('setMember', res.data.member)
          this.$refs.password.value = ''
          this.$refs.password_confirm.value = ''
          if (res.data.updated) this.showSuccess = true
        }
      }).catch(err => {
        console.error(err)
        this.messages.error.push('Something is wrong.')
      })
    },
    checkParams() {
      ['name', 'email'].forEach(key => {
        if (!this.$refs[key].value) {
          this.messages.error.push(`${key} is required.`)
        }
      })
      const regex = /^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)[a-zA-Z\d]{8,100}$/
      if (this.$refs.password.value) {
        if (!regex.test(this.$refs.password.value)) {
          this.messages.error.push('Password must contain at least one uppercase letter, one lowercase letter and a number. And must be 8 or more characters.')
        }
        if (this.$refs.password.value !== this.$refs.password_confirm.value) {
          this.messages.error.push(`Password cannot be verified.`)
        }
      }
      if (this.messages.error.length) {
        return false
      } else {
        return true
      }
    },
  },
}
</script>

<style lang="scss" scoped>
.container {
  text-align: initial;
  label {
    font-weight: bold;
  }
  .mb-3, .row {
    .form-check-inline {
      vertical-align: sub;
      label {
        vertical-align: inherit;
        font-weight: inherit;
      }
    }
  }
}

@media (min-width: 992px) {
  .container {
    max-width: 720px;
  }
}

.error {
  color: #DD4C70;
}
</style>
