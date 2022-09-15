import { defineConfig } from 'vite'
import env from 'vite-plugin-env-compatible'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    env(),
    vue(),
  ],
  server: {
    host: true
  },
})
