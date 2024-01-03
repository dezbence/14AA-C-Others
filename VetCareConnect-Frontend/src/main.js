import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import PrimeVue from 'primevue/config'

import './assets/main.css'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.bundle.js'
import 'primevue/resources/themes/saga-green/theme.css'

const app = createApp(App)

app.use(createPinia())
app.use(PrimeVue)
app.use(router).mount('#app')

