import { createApp } from 'vue'
import { createPinia } from 'pinia'

import Toast from 'vue-toastification'
import 'vue-toastification/dist/index.css'
import router from './router'
import PrimeVue from 'primevue/config'
import App from './App.vue'

import 'primevue/resources/themes/saga-green/theme.css'
import './assets/main.css'

const app = createApp(App)

app.use(createPinia())
app.use(PrimeVue)
app.use(router).mount('#app')
app.use(Toast, {
    transition: "Vue-Toastification__bounce",
    maxToasts: 3,
    newestOnTop: true
  });
  
