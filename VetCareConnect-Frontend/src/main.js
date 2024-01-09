import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'
import PrimeVue from 'primevue/config'

import 'primevue/resources/themes/saga-green/theme.css'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap/dist/js/bootstrap.bundle.js'
import './assets/main.css'

const app = createApp(App)

app.use(createPinia())
app.use(PrimeVue)
app.use(router).mount('#app')

