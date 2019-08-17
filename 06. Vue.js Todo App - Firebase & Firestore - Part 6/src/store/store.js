import Vue from 'vue'
import Vuex from 'vuex'
import db from '../firebase'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    loading: true,
    filter: 'all',
    todos: []
  },
  getters: {
    remaining(state){
      return state.todos.filter(todo => !todo.completed).length
    },
    anyRemaining(state, getters){
      return getters.remaining != 0
    },
    todosFiltered(state){
      if (state.filter == 'all'){
        return state.todos
      }else if(state.filter == 'active'){
        return state.todos.filter(todo => !todo.completed)
      }else if(state.filter == 'completed'){
        return state.todos.filter(todo => todo.completed)
      }

      return state.todos
    },
    showClearCompletedButton(state){
      return state.todos.filter(todo => todo.completed).length
    }
  },
  mutations: {
    addTodo(state, todo){
      state.todos.push({
        id: todo.id,
        title: todo.title,
        complete: false,
        editing: false
      })
    },
    clearCompleted(state){
      state.todos = state.todos.filter(todo => !todo.completed)
    },
    updateFilter(state, filter){
      state.filter = filter
    },
    checkAll(state, checked){
      state.todos.forEach((todo) => todo.completed = checked)
    },
    deleteTodo(state, id){
      const index = state.todos.findIndex(item => item.id == id);
      state.todos.splice(index, 1)
    },
    updateTodo(state, todo){
      const index = state.todos.findIndex((item) => item.id == todo.id)
      state.todos.splice(index, 1, {
        'id' : todo.id,
        'title' : todo.title,
        'completed': todo.completed,
        'editing': todo.editing
      })
    },
    pluralize(state, todo){
      const index = state.todos.findIndex((item) => item.id == todo.id)
      state.todos.splice(index, 1, {
        'id' : todo.id,
        'title' : todo.title,
        'completed': todo.completed,
        'editing': todo.editing
      })
    },
    retriveTodos(state, todos){
      state.todos = todos
    }
  },
  actions: {
    retriveTodos(context){
      context.state.loading = true
      db.collection('todos').get()
        .then(querySnapshot => {
          let tempTodos = []
          querySnapshot.forEach(doc => {
            const data = {
              id : doc.id,
              title: doc.data().title,
              completed: doc.data().completed,
              timestamp: doc.data().timestamp
            }
            tempTodos.push(data)
          })

          context.state.loading = false
          const tempTodosSorted = tempTodos.sort((a, b) => {
            return a.timestamp.seconds - b.timestamp.seconds
          })
          context.commit('retriveTodos', tempTodosSorted)
        })

    },
    addTodo(context, todo){
      db.collection('todos').add({
        title: todo.title,
        completed: false,
        timestamp: new Date()
      })
        .then(docRef => {
          context.commit('addTodo', {
            id: docRef.id,
            title: todo.title,
            completed: todo.completed
          })
        })
    },
    clearCompleted(context){
      db.collection('todos').where('completed', '==', true).get()
        .then(querySnapshot => {
          querySnapshot.forEach(doc => {
            doc.ref.delete();
          })
        }).then(() => {
        context.commit('clearCompleted')
      })
    },
    updateFilter(context, filter){
      context.commit('updateFilter', filter)
    },
    checkAll(context, checked){
      db.collection('todos').get()
        .then(querySnapshot => {
          querySnapshot.forEach(doc => {
            doc.ref.update({
              completed: checked
            })
          })
        })
        .then(() => {
          context.commit('checkAll', checked)
        })
    },
    deleteTodo(context, id){
      db.collection('todos').doc(id).delete()
        .then(() => {
          context.commit('deleteTodo', id)
        })
    },
    updateTodo(context, todo){
      db.collection('todos').doc(todo.id).set({
        id: todo.id,
        title: todo.title,
        completed: todo.completed,
        timestamp: new Date()
      })
        .then(() => {
          context.commit('updateTodo', todo)
        })
    },
    pluralize(context, todo){
      context.commit('pluralize', todo)
    }
  }

});
