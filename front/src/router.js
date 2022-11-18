import { createRouter, createWebHistory } from 'vue-router'
import DogApi from "./components/Body/DogAPI.vue"
import Login from "./components/Body/Login.vue"
import Register from "./components/Body/Register.vue"

const routes = [
  {
    path: '/',
    name: 'home',
  },
  {
    path: '/dogapi',
    name: 'dogapi',
    component: DogApi,
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router
