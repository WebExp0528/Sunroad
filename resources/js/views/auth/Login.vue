<template>
  <div class="login-block d-flex justify-content-center">
    <div class="card text-dark bg-light mb-3 " style="width: 500px;">
      <div class="card-header text-center font-weight-bold">
          <h2>Please login</h2>
      </div>
      <div class="card-body">
        <form @submit.prevent="validateBeforeSubmit">
          <div :class="['form-group', {'is-invalid': $v.loginData.email.$error}]">
            <input
              :class="{ 'is-invalid': $v.loginData.email.$error }"
              v-model.trim="loginData.email"
              class="form-control"
              placeholder="Enter Email"
              type="email"
              @input="$v.loginData.email.$touch()"
            >
            <span v-if="!$v.loginData.email.required" class="invalid-feedback">
              Email is required
            </span>
            <span v-if="!$v.loginData.email.email" class="invalid-feedback">
              Email is invalid
            </span>
          </div>
          <div :class="['form-group', {'is-invalid': $v.loginData.password.$error}]">
            <input
              :class="{ 'is-invalid': $v.loginData.password.$error }"
              v-model.trim="loginData.password"
              class="form-control"
              placeholder="Enter Password"
              type="password"
              @input="$v.loginData.password.$touch()"
            >
            <span v-if="!$v.loginData.password.required" class="invalid-feedback">
              Password is required
            </span>
            <span v-if="!$v.loginData.password.minLength" class="invalid-feedback">
              Password must have at least {{ $v.loginData.password.$params.minLength.min }} letters.
            </span>
          </div>
          <button class="btn btn-theme btn-full">Login</button>
        </form>
      </div>  
      <div class="card-footer">
        <ul class="list-inline social-connect">
        </ul>
        <div class="problem-login">
            <div class="pull-left">Don't have an account yet?<router-link to="/register"  class="text-success"> Get started</router-link></div>
            <div class="pull-right"><router-link to="/forget-password"  class="text-success">Forgot password?</router-link></div>
            <div class="clearfix"></div>
        </div>
      </div>
    </div> 
  </div>
</template>

<script type="text/babel">
import {required, minLength, email} from 'vuelidate/lib/validators'
import Auth from '../../services/auth'

export default {
  data () {
    return {
      loginData: {
        email: '',
        password: '',
        remember: ''
      }
    }
  },
  validations: {
    loginData: {
      password: {
        required,
        minLength: minLength(6)
      },
      email: {
        required,
        email
      }
    }
  },
  methods: {
    validateBeforeSubmit () {
      this.$v.$touch()

      if (!this.$v.$error) {
        Auth.login(this.loginData).then((res) => {
          console.log(res)
          if (res) {
            this.$router.push('/')
          }
        })
      }
    }
  }
}
</script>
