import { createRouter, createWebHistory } from 'vue-router'
import DogApi from "./components/Body/DogAPI.vue"
import SignIn from "./components/Body/SignIn.vue"
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
    path: '/sign_in',
    name: 'signin',
    component: SignIn,
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
