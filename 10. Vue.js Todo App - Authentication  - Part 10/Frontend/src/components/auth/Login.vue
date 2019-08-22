<template>
  <div class="login-form">
    <h2 class="login-heading">Login</h2>
    <form action="#" @submit.prevent="login">
      <div class="form-control">
        <label for="email">Username/Email</label>
        <input type="email" v-model="username" name="username" id="email" class="login-input">
      </div>
      <div class="form-control mb-more">
        <label for="password">Password</label>
        <input type="password" v-model="password" name="password" id="password" class="login-input">
      </div>
      <div class="form-control">
        <button type="submit" class="btn-submit">Login</button>
      </div>
    </form>
  </div>
</template>

<script>
  export default {
    name: 'Login',
    data(){
      return {
        username: '',
        password: ''
      }
    },
    methods:{
      login(){
        this.$store.dispatch('retrieveToken', {
          username: this.username,
          password: this.password
        })
          .then(response => {
            this.$router.push({ name: 'todo' })
          })
      }
    },
    created() {
      console.log(localStorage.getItem('access_token'))
    }
  }
</script>
