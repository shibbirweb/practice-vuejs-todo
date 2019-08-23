import App from './App'
import LandingPage from './components/marketing/LandingPage'
import About from './components/marketing/About'
import TestTodosVariable from './components/marketing/TestTodosVariable'
import Login from './components/auth/Login'
import Logout from './components/auth/Logout'
import Register from './components/auth/Register'

const routes = [
  {
    path: '/',
    name: 'home',
    component: LandingPage
  },
  {
    path: '/todo',
    name: 'todo',
    component: App,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/about-us',
    name: 'about',
    component: About
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    props: true,
    meta: {
      requiresVisitor: true
    }
  },
  {
    path: '/logout',
    name: 'logout',
    component: Logout
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
    meta: {
      requiresVisitor: true
    }
  },
  {
    path: '/todos/:id',
    name: 'todos',
    component: TestTodosVariable
  },
]


export default routes
