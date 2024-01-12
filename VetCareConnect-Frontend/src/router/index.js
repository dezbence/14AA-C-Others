import { createRouter, createWebHistory } from 'vue-router'
import HomePageVue from '@/views/HomePage.vue'
// import AppointmentBookingPageVue from '@/views/user/AppointmentBookingPage.vue'
// import PetsPageVue from '@/views/user/PetsPage.vue'
// import AppointmentsPageVue from '@/views/user/AppointmentsPage.vue'
// import LoginPageVue from '@/views/login/LoginPage.vue'
// import RegisterPageVue from '@/views/login/RegisterPage.vue'
// import ForgotPasswordPageVue from '@/views/login/ForgotPasswordPage.vue'
import NotFoundPageVue from '@/views/NotFoundPage.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes:  [
    {
      path: '/',
      name: 'home',
      component: HomePageVue
    },
    {
      path: '/idopontfoglalas',
      name: 'appointmentBooking',
      component: () => import('@/views/user/AppointmentBookingPage.vue')
    },
    {
      path: '/kedvenceim',
      name: 'pets',
      component: () => import('@/views/user/PetsPage.vue')
    },
    {
      path: '/naptaram',
      name: 'appointments',
      component: () => import('@/views/user/AppointmentsPage.vue')
    },
    {
      path: '/bejelentkezes',
      name: 'login',
      component: () => import('@/views/login/LoginPage.vue')
    },
    {
      path: '/regisztracio',
      name: 'register',
      component: () => import('@/views/login/RegisterPage.vue')
    },
    {
      path: '/forgot-password',
      name: 'forgotPassword',
      component: () => import('@/views/login/ForgotPasswordPage.vue')
    },
    // catch all 404
    {
      path: '/:catchAll(.*)',
      name: 'notfound',
      component: NotFoundPageVue
    }
  ]
})

export default router