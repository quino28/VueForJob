import { createApp } from 'vue'
import App from './App.vue'
import Axios from './plugins/axios'
import BootstrapVue3 from 'bootstrap-vue-3'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue-3/dist/bootstrap-vue-3.css'
import './assets/css/reset.css'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { library } from '@fortawesome/fontawesome-svg-core'
import Router from './router.js'
import Store from './store.js'

const app = createApp(App)

app.use(Axios)
app.use(BootstrapVue3)
app.use(Router)
app.use(Store)

library.add(fas)
app.component("font-awesome-icon", FontAwesomeIcon)

app.mount('#app')
