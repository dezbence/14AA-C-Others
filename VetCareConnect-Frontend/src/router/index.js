import { createRouter, createWebHistory } from 'vue-router'
import HomePageVue from '@/views/HomePage.vue'
import AppointmentBookingPageVue from '@/views/user/AppointmentBookingPage.vue'
import PetsPageVue from '@/views/user/PetsPage.vue'
import AppointmentsPageVue from '@/views/user/AppointmentsPage.vue'
import LoginPageVue from '@/views/login/LoginPage.vue'
import RegisterPageVue from '@/views/login/RegisterPage.vue'
import ForgotPasswordPageVue from '@/views/login/ForgotPasswordPage.vue'
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
      component: AppointmentBookingPageVue
    },
    {
      path: '/kedvenceim',
      name: 'pets',
      component: PetsPageVue
    },
    {
      path: '/naptaram',
      name: 'appointments',
      component: AppointmentsPageVue
    },
    {
      path: '/bejelentkezes',
      name: 'login',
      component: LoginPageVue
    },
    {
      path: '/regisztracio',
      name: 'register',
      component: RegisterPageVue
    },
    {
      path: '/forgot-password',
      name: 'forgotPassword',
      component: ForgotPasswordPageVue
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