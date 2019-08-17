<template>
  <div class="todo-item">
    <div class="todo-item-left">
      <input type="checkbox" v-model="completed" @change="doneEdit">
      <div v-if="!editing" @dblclick="editTodo" class="todo-item-label" :class="{completed : completed}">{{ title }}</div>
      <input v-else @blur="doneEdit" @keyup.enter="doneEdit" @keyup.esc="cancelEdit" class="todo-item-edit" type="text" v-model="title" v-focus>
    </div>
    <div>
      <button @click="pluralize">Plural</button>
      <span class="remove-item" @click="removeTodo(index)">&times;</span>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'TodoItem',
    props:{
      todo: {
        type: Object,
        required: true
      },
      index: {
        type: Number,
        required: true
      },
      checkAll: {
        type: Boolean,
        required: true
      }
    },
    data(){
      return {
        'id' : this.todo.id,
        'title': this.todo.title,
        'completed': this.todo.completed,
        'editing': this.todo.editing,
        'beforeEditCache': ''
      }
    },
    created(){
      eventBus.$on('pluralize', this.handlePluralize)
    },
    beforeDestroy(){
      eventBus.$off('pluralize', this.handlePluralize)
    },
    watch:{
      checkAll(){
        this.completed = this.checkAll ? true : this.todo.completed
      }
    },
    directives: {
      focus: {
        // directive definition
        inserted: function (el) {
          el.focus()
        }
      }
    },
    methods:{
      removeTodo(index){
        eventBus.$emit('removedTodo', index)
      },
      cancelEdit(){
        this.title = this.beforeEditCache
        this.editing = false
      },
      editTodo(){
        this.beforeEditCache = this.title
        this.editing = true
      },
      doneEdit(){
        if (this.title.trim() == ''){
          this.title = this.beforeEditCache
        }
        this.editing = false
        eventBus.$emit('finishedEdit', {
          'index' : this.index,
          'todo' : {
            'id' : this.id,
            'title' : this.title,
            'completed': this.completed,
            'editing': this.editing
          }
        })
      },
      pluralize(){
        eventBus.$emit('pluralize')
      },
      handlePluralize(){
        this.title = this.title + 's'

        eventBus.$emit('finishedEdit', {
          'index' : this.index,
          'todo' : {
            'id' : this.id,
            'title' : this.title,
            'completed': this.completed,
            'editing': this.editing
          }
        })
      }
    }

  }
</script>
