<template>
  <div class="page-wrapper flex-center">
    <div class="login-form">
      <h2 class="login-heading">Register</h2>
      <form action="#" @submit.prevent="validateBeforeSubmit">
        <div v-if="serverErrors" class="server-error">
          <ul>
            <li v-for="(value, index) in serverErrors" :key="index">{{ value[0] }}</li>
          </ul>
        </div>
        <!--<div v-if="successMessage" class="success-message">{{ successMessage }}</div>-->
        <div class="form-control">
          <label for="name">Name</label>
          <input type="text" :class="{'input-error' : errors.has('name')}" v-model="name" v-validate="'required'" name="name" id="name" class="login-input">
          <span class="form-error">{{ errors.first('name') }}</span>
        </div>
        <div class="form-control">
          <label for="email">Username/Email</label>
          <input type="email" :class="{'input-error' : errors.has('username')}" v-model="email" v-validate="'required|email'" name="username" id="email" class="login-input">
          <span class="form-error">{{ errors.first('username') }}</span>
        </div>
        <div class="form-control mb-more">
          <label for="password">Password</label>
          <input type="password" :class="{'input-error' : errors.has('password')}" v-model="password" v-validate="'required|min:6'" name="password" id="password" class="login-input">
          <span class="form-error">{{ errors.first('password') }}</span>
        </div>
        <div class="form-control">
          <button type="submit" class="btn-submit">Register</button>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'Register',
    data(){
      return {
        name: '',
        email: '',
        password: '',
        serverErrors: '',
        successMessage: ''
      }
    },
    methods:{
      validateBeforeSubmit() {
        this.$validator.validateAll().then((result) => {
          if (result) {
            // eslint-disable-next-line
            // alert('Form Submitted!');
            // return;
            this.register()
          }

          // alert('Correct them errors!');
        });
      },
      register(){
        this.$store.dispatch('register', {
          name: this.name,
          email: this.email,
          password: this.password
        })
          .then(response => {
            this.successMessage = 'Registered Successfully'
            this.$router.push({ name: 'login', params: { dataSuccessMessage: this.successMessage } })

            this.$toast.success({
              title: this.successMessage,
              message:'You can login now'
            })
          })
          .catch(error => {
            this.serverErrors = Object.values(error.response.data.errors)
          })
      }
    }
  }
</script>
