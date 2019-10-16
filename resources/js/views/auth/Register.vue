<template>
  <div class="login-block d-flex justify-content-center">
    <div class="card bg-light" style="width:550px">
      <div class="card-header text-center">
          <h2>Welcome To</h2>
      </div>
      <div class="card-body">
        <form @submit.prevent="validateBeforeSubmit">
          <div :class="['form-group', {'is-invalid': $v.registerData.firstName.$error}]">
            <input
              :class="{'is-invalid': $v.registerData.firstName.$error, 'form-group--loading': $v.registerData.firstName.$pending}"
              v-model.trim.lazy="registerData.firstName"
              class="form-control"
              placeholder="Enter Firstname"
              type="text"
              @change="$v.registerData.firstName.$touch()"
            >
            <span v-if="!$v.registerData.firstName.required" class="invalid-feedback">
              Firstname is required.
            </span>
          </div>
          <div :class="['form-group', {'is-invalid': $v.registerData.lastName.$error}]">
            <input
              :class="{'is-invalid': $v.registerData.lastName.$error, 'form-group--loading': $v.registerData.lastName.$pending}"
              v-model.trim.lazy="registerData.lastName"
              class="form-control"
              placeholder="Enter Lastname"
              type="text"
              @change="$v.registerData.lastName.$touch()"
            >
            <span v-if="!$v.registerData.lastName.required" class="invalid-feedback">
              Lastname is required.
            </span>
          </div>
          <div :class="['form-group', {'is-invalid': $v.registerData.displayName.$error}]">
            <input
              :class="{'is-invalid': $v.registerData.displayName.$error, 'form-group--loading': $v.registerData.displayName.$pending}"
              v-model.trim.lazy="registerData.displayName"
              class="form-control"
              placeholder="Enter Display Name"
              type="text"
              @change="$v.registerData.displayName.$touch()"
            >
            <span v-if="!$v.registerData.displayName.required" class="invalid-feedback">
              DisplayName is required.
            </span>
          </div>
          <!-- <div :class="['form-group', {'is-invalid': $v.registerData.creativeField.$error}]">
            <input
              :class="{'is-invalid': $v.registerData.creativeField.$error, 'form-group--loading': $v.registerData.creativeField.$pending}"
              v-model.trim.lazy="registerData.creativeField"
              class="form-control"
              placeholder="Select Creative Field"
              type="text"
              @change="$v.registerData.creativeField.$touch()"
            >
            <span v-if="!$v.registerData.creativeField.required" class="invalid-feedback">
              Creative Filed is required.
            </span>
          </div> -->
          <div :class="['form-group', {'is-invalid': $v.registerData.email.$error}]">
            <input
              :class="{'is-invalid': $v.registerData.email.$error, 'form-group--loading': $v.registerData.email.$pending}"
              v-model.trim.lazy="registerData.email"
              class="form-control"
              placeholder="Enter Email"
              type="email"
              @change="$v.registerData.email.$touch()"
            >
            <span v-if="!$v.registerData.email.required" class="invalid-feedback">
              Email is required.
            </span>
            <span v-if="!$v.registerData.email.email" class="invalid-feedback">
              Please verify your email.
            </span>
            <span v-if="!$v.registerData.email.isUnique" class="invalid-feedback">
              This email is already registered.
            </span>
          </div>
          <div :class="['form-group', {'is-invalid': $v.registerData.password.$error}]">
            <input
              :class="{ 'is-invalid': $v.registerData.password.$error }"
              v-model.trim="registerData.password"
              class="form-control"
              placeholder="Enter Password"
              type="password"
              @change="$v.registerData.password.$touch()"
            >
            <span v-if="!$v.registerData.password.required" class="invalid-feedback">
              Password is required.
            </span>
            <span v-if="!$v.registerData.password.minLength" class="invalid-feedback">
              Password must have at least {{ $v.registerData.password.$params.minLength.min }} letters.
            </span>
          </div>
          <div :class="['form-group', {'is-invalid': $v.registerData.password_confirmation.$error}]">
            <input
              :class="{ 'is-invalid': $v.registerData.password_confirmation.$error }"
              v-model.trim="registerData.password_confirmation"
              class="form-control"
              placeholder="Retype Password"
              type="password"
              @change="$v.registerData.password_confirmation.$touch()"
            >
            <span v-if="!$v.registerData.password_confirmation.sameAsPassword" class="invalid-feedback">
              Passwords must be identical.
            </span>
          </div>
          <button class="btn btn-theme btn-full">Register</button>
        </form>
      </div>
      <div class="card-footer">
        <ul class="list-inline social-connect">
        </ul>
        <div class="problem-login">
            <div class="pull-right">Already have an account?<router-link to="/login" class="text-info"> Login</router-link></div>
            <div class="clearfix"></div>
        </div>
      </div>
    </div>
  </div>
</template>
<script type="text/babel">
import Auth from '../../services/auth'
import {required, minLength, email, sameAs} from 'vuelidate/lib/validators'

export default {
  data () {
    return {
      registerData: {
        firstName:'',
        lastName:'',
        displayName:'',
        creativeField:'',
        email: '',
        password: '',
        password_confirmation: ''
      }
    }
  },
  validations: {
    registerData: {
      firstName:{
        required
      },
      lastName:{
        required
      },
      displayName:{
        required
      },
      // creativeField:{
      //   required
      // },
      password: {
        required,
        minLength: minLength(6)
      },
      password_confirmation: {
        sameAsPassword: sameAs('password')
      },
      email: {
        required,
        email,
        async isUnique (value) {
          // standalone validator ideally should not assume a field is required
          if (value === '') return true

          // simulate async call, fail for all logins with even length
          let response = await window.axios.post('/api/auth/email-exist', { email: value })
          return !response.data.isExist
        }
      }
    }
  },
  methods: {
    validateBeforeSubmit () {
      this.$v.$touch()
      if (!this.$v.$error) {
        Auth.register(this.registerData).then((res) => {
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
