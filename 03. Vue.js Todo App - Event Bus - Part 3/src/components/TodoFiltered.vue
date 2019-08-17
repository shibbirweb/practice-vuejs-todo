<template>
  <div>
    <button :class="{active: filter == 'all'}" @click="changeFilter('all')">All</button>
    <button :class="{active: filter == 'active'}" @click="changeFilter('active')">Active</button>
    <button :class="{active: filter == 'completed'}" @click="changeFilter('completed')">Completed</button>
  </div>
</template>

<script>
  export default {
    name: 'TodoFiltered',
    data(){
      return {
        filter: 'all',
      }
    },
    methods:{
      changeFilter(string){
        this.filter = string
        eventBus.$emit('filterChanged', this.filter)
      }
    }
  }
</script>
