<template>
  <div>
    <input type="text" class="todo-input" placeholder="What needs to be done" v-model="newTodo" @keyup.enter="addTodo">
    <div v-if="!todosFiltered.length" class="text-center">No todo found</div>
    <transition-group v-else name="fade" enter-active-class="animated fadeInUp" leave-active-class="animated fadeOutDown">
      <todo-item v-for="(todo, index) in todosFiltered" :key="todo.id" :todo="todo" :index="index" :checkAll="!anyRemaining"/>
    </transition-group>

    <div class="extra-container">
      <todo-check-all :anyRemaining="anyRemaining"/>
      <todo-item-remaining :remaining="remaining"/>
    </div>

    <div class="extra-container">
      <todo-filtered />

      <div>
        <transition name="fade">
          <todo-clear-completed :showClearCompletedButton="showClearCompletedButton"/>
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
        idForTodo: 3,
        filter: 'all',
        beforeEditCache: '',
        todos: [
          {
            'id': 1,
            'title': 'Finish Vue Screencast',
            'completed': false,
            'editing': false
          },
          {
            'id': 2,
            'title': 'Second todo item',
            'completed': false,
            'editing': false
          }
        ]
      }
    },
    computed:{
      remaining(){
        return this.todos.filter(todo => !todo.completed).length
      },
      anyRemaining(){
        return this.remaining != 0
      },
      todosFiltered(){
        if (this.filter == 'all'){
          return this.todos
        }else if(this.filter == 'active'){
          return this.todos.filter(todo => !todo.completed)
        }else if(this.filter == 'completed'){
          return this.todos.filter(todo => todo.completed)
        }

        return this.todos
      },
      showClearCompletedButton(){
        return this.todos.filter(todo => todo.completed).length
      }
    },
    created() {
      eventBus.$on('removedTodo', (index) => this.removeTodo(index))
      eventBus.$on('finishedEdit', (data) => this.finishedEdit(data))
      eventBus.$on('checkAllChanged', (checked) => this.checkAllTodos(checked))
      eventBus.$on('filterChanged', (filter) => this.filter = filter)
      eventBus.$on('clearCompletedTodos', () => this.clearCompleted())
    },
    beforeDestroy(){
      eventBus.$off('removedTodo', (index) => this.removeTodo(index))
      eventBus.$off('finishedEdit', (data) => this.finishedEdit(data))
      eventBus.$off('checkAllChanged', (checked) => this.checkAllTodos(checked))
      eventBus.$off('filterChanged', (filter) => this.filter = filter)
      eventBus.$off('clearCompletedTodos', () => this.clearCompleted())
    },
    methods:{
      addTodo(){
        if (this.newTodo.trim().length == 0) return;
        this.todos.push({
          id: this.idForTodo,
          title: this.newTodo,
          complete: false
        });

        this.newTodo = '';
        this.idForTodo++
      },

      removeTodo(index){
        this.todos.splice(index, 1)
      },
      checkAllTodos(){
        this.todos.forEach((todo) => todo.completed = event.target.checked)

      },
      clearCompleted(){
        this.todos = this.todos.filter(todo => !todo.completed)
      },
      finishedEdit(data){
        const index = this.todos.findIndex((item) => item.id == data.id)
        this.todos.splice(index, 1, data.todo)
      }
    }
  }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss">
  @import url("https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css");
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
