<template>
  <div>{{ remaining }} items left</div>
</template>

<script>
  export default {
    name: 'TodoItemRemaining',
    props:{
      remaining: Number,
      required: true
    }
  }
</script>
