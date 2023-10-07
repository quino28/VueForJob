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
    path: '/my_profile',
    name: 'my_profile',
    component: () => import('./views/MyProfile.vue'),
  },
  {
    path: '/sign_in',
    name: 'sign_in',
    component: () => import('./views/SignIn.vue'),
  },
  {
    path: '/sign_up',
    name: 'sign_up',
    component: () => import('./views/SignUp.vue'),
  },
  {
    path: '/:catchAll(.*)*',
    name: 'not_found',
    component: () => import('./views/NotFound.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
export default router
