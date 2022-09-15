import { createApp } from 'vue'
import App from './App.vue'
import Axios from './plugins/axios'
import BootstrapVue3 from 'bootstrap-vue-3'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue-3/dist/bootstrap-vue-3.css'
import './assets/css/reset.css'

const app = createApp(App)

app.use(BootstrapVue3)
app.use(Axios)

app.mount('#app')
