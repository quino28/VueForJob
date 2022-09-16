import Axios from 'axios'

export default {
  install(app) {
    app.config.globalProperties.$axios = Axios.create({
      baseURL: process.env.VUE_APP_API_BASE_URL,
      headers: {
        'Content-Type': 'application/json',
      },
      responseType: 'json',
      timeout: 3000,
    })
  }
}
