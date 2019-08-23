<template>
  <div>
    <div class="name-container">
      Welcome, {{ name }}
    </div>
    <input type="text" class="todo-input" placeholder="What needs to be done" v-model="newTodo" @keyup.enter="addTodo">
    <div v-if="!todosFiltered.length" class="text-center">No todo found</div>
    <transition-group v-else name="fade" enter-active-class="animated fadeInUp" leave-active-class="animated fadeOutDown">
      <todo-item v-for="(todo, index) in todosFiltered" :key="todo.id" :todo="todo" :index="index" :checkAll="!anyRemaining"/>
    </transition-group>

    <div class="extra-container">
      <todo-check-all/>
      <todo-item-remaining/>
    </div>

    <div class="extra-container">
      <todo-filtered />

      <div>
        <transition name="fade">
          <todo-clear-completed/>
        </transition>
      </div>
    </div>
  </div>
</template>

<script>
  import TodoItem from './TodoItem'
  import TodoItemRemaining from "./TodoItemRemaining"
  import TodoCheckAll from "./TodoCheckAll"
  import TodoFiltered from "./TodoFiltered";
  import TodoClearCompleted from "./TodoClearCompleted";
  export default {
    name: 'TodoList',
    components: {
      TodoClearCompleted,
      TodoFiltered,
      TodoItemRemaining,
      TodoItem,
      TodoCheckAll
    },
    data () {
      return {
        newTodo: '',
        name: ''
      }
    },
    created(){
      this.$store.dispatch('retrieveName')
        .then(response => {
          this.name = response.name
        })
      this.$store.dispatch('retriveTodos')
    },
    computed:{
      anyRemaining(){
        return this.$store.getters.anyRemaining
      },
      todosFiltered(){
        return this.$store.getters.todosFiltered
      }
    },
    methods:{
      addTodo(){
        if (this.newTodo.trim().length == 0) return;

        this.$store.dispatch('addTodo', {
          title: this.newTodo
        })
        this.newTodo = '';
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss">
.todo-input{
  width: 100%;
  padding: 10px 18px;
  font-size: 18px;
  margin-bottom: 16px;

  &:focus{
    outline: 0;
  }
}
  .todo-item{
    margin-bottom: 12px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    -webkit-animation-duration: 0.3s;
    -moz-animation-duration: 0.3s;
    -o-animation-duration: 0.3s;
    animation-duration: 0.3s;
  }
  .remove-item{
    cursor: pointer;
    margin-left: 14px;
    &:hover{
      color: #000;
    }
  }
  .todo-item-left {
    display: flex;
    align-items: center;
  }
  .todo-item-label{
    padding: 10px;
    border: 1px solid white;
    margin-left: 12px;
  }
  .todo-item-edit{
    font-size: 24px;
    color: #2c3e50;
    margin-left: 12px;
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    font-family: 'Avenir', Helvetica, Arial, sans-serif;

    &:focus{
      outline: none;
    }
  }
  .text-center{
    text-align: center;
  }
  .completed {
    text-decoration: line-through;
    color: gray;
  }

  .extra-container{
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 16px;
    border-top: 1px solid lightgray;
    padding-top: 14px;
    margin-bottom: 14px;
  }

  button{
    font-size: 14px;
    background-color: white;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    padding: 4px;

    &:hover{
      background: lightgreen;
    }
    &:focus{
      outline: none;
    }
  }
  .active{
    background: lightgreen;
  }

  //css transitions
  .fade-enter-active, .fade-leave-active{
    -webkit-transition: opacity .2s;
    -moz-transition: opacity .2s;
    -ms-transition: opacity .2s;
    -o-transition: opacity .2s;
    transition: opacity .2s;
  }
  .fade-enter, .fade-leave-to{
    opacity: 0;
  }
</style>
