import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    name: 'home',
  },
  {
    path: '/dogapi',
    name: 'dogapi',
    component: () => import('./views/DogApi.vue'),
  },
  {
    path: '/sign_in',
    name: 'signin',
    component: () => import('./views/SignIn.vue'),
  },
  {
    path: '/sign_up',
    name: 'sign_up',
    component: () => import('./views/SignUp.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router
