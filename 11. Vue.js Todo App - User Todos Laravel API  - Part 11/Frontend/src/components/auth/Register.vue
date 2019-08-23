<template>
  <div class="flex-center">
    <div class="login-form">
      <h2 class="login-heading">Register</h2>
      <form action="#" @submit.prevent="register">
        <div class="form-control">
          <label for="name">Name</label>
          <input type="text" v-model="name" name="name" id="name" class="login-input">
        </div>
        <div class="form-control">
          <label for="email">Username/Email</label>
          <input type="email" v-model="email" name="username" id="email" class="login-input">
        </div>
        <div class="form-control mb-more">
          <label for="password">Password</label>
          <input type="password" v-model="password" name="password" id="password" class="login-input">
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
        password: ''
      }
    },
    methods:{
      register(){
        this.$store.dispatch('register', {
          name: this.name,
          email: this.email,
          password: this.password
        })
          .then(response => {
            this.$router.push({ name: 'login' })
          })
      }
    }
  }
</script>
