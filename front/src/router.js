import { createRouter, createWebHistory } from 'vue-router'
import DogApi from "./components/Body/DogAPI.vue"
import Login from "./components/Body/Login.vue"

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
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router
