import { createRouter, createWebHistory } from 'vue-router'
import HomePageVue from '@/views/HomePage.vue'
// import AppointmentBookingPageVue from '@/views/user/AppointmentBookingPage.vue'
// import PetsPageVue from '@/views/user/PetsPage.vue'
// import AppointmentsPageVue from '@/views/user/AppointmentsPage.vue'
// import LoginPageVue from '@/views/login/LoginPage.vue'
// import RegisterPageVue from '@/views/login/RegisterPage.vue'
// import ForgotPasswordPageVue from '@/views/login/ForgotPasswordPage.vue'
import NotFoundPageVue from '@/views/NotFoundPage.vue'
import { useUserStore } from '../store/userstore.js'
import { storeToRefs } from 'pinia'
import { useToast } from 'vue-toastification'
import { nextTick } from 'vue'

const toast = useToast();

const access = {
  '/': [0, 1, null],
  '/idopontfoglalas': [0],
  '/kedvenceim': [0],
  '/naptaram': [0],
  '/bejelentkezes': [null],
  '/regisztracio': [null],
  '/elfelejtett-jelszo': [null],
  '/uj-jelszo': [null],
  '/allatorvosok': [0, 1, null],
  '/gyik': [0, 1, null],
  '/orvosi-naptar': [1],
  '/nyitvatartas': [1],
  '/adataim': [0, 1],
  '/admin': [0, 1, null],
  '/:catchAll(.*)': [0, 1, null]
};

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', name: 'home', component: HomePageVue },
    { path: '/idopontfoglalas/:doctorId?', name: 'appointmentBooking', component: () => import('@/views/user/AppointmentBookingPage.vue') },
    { path: '/kedvenceim', name: 'pets', component: () => import('@/views/user/PetsPage.vue') },
    { path: '/naptaram', name: 'appointments', component: () => import('@/views/user/AppointmentsPage.vue') },
    { path: '/bejelentkezes', name: 'login', component: () => import('@/views/login/LoginPage.vue') },
    { path: '/regisztracio', name: 'register', component: () => import('@/views/login/RegisterPage.vue') },
    { path: '/elfelejtett-jelszo', name: 'forgotPassword', component: () => import('@/views/login/ForgotPasswordPage.vue') },
    { path: '/uj-jelszo/:token?', name: 'resetPassword', component: () => import('@/views/login/PasswordReset.vue') },
    { path: '/allatorvosok', name: 'vets', component: () => import('@/views/VetSearchPage.vue') },
    { path: '/gyik', name: 'gyik', component: () => import('@/views/FrequentlyAskedQuestionsPage.vue') },
    { path: '/orvosi-naptar', name: 'orvosiNaptar', component: () => import('@/views/vet/VetCalendar.vue') },
    { path: '/nyitvatartas', name: 'nyitvatartas', component: () => import('@/views/vet/VetSettingsPage.vue') },
    { path: '/adataim', name: 'myData', component: () => import('@/views/MyDataPage.vue') },
    { path: '/admin', name: 'admin', component: () => import('@/views/AdminPage.vue') },
    // catch all 404
    { path: '/:catchAll(.*)', name: 'notfound', component: NotFoundPageVue }
  ]
})

router.beforeEach((to, from, next) => {
  const { status, user } = storeToRefs(useUserStore());
  const publicPages = ['/', '/bejelentkezes', '/regisztracio', '/allatorvosok', '/gyik', '/elfelejtett-jelszo', '/uj-jelszo/:token?', '/:catchAll(.*)'];
  const autRequired = !publicPages.includes(to.path);
  if (autRequired && !status.value.loggedIn) {
    toast.error("Bejelentkezés szükséges!", { position: "top-center" });
    return next('/');
  } else if(!to.path.startsWith("/idopontfoglalas/") && !access[to.path].includes(user.value.role)){
    toast.error("Jogosultság szükséges!", { position: "top-center" });
    return next('/');
  } else if(to.path.startsWith("/idopontfoglalas/")){
    if (status.value.loggedIn && user.value.role == 0) {
      return next();
    }
  }
  next();
});

export default router