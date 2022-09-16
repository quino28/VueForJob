import { defineConfig } from 'vite'
import EnvironmentPlugin from 'vite-plugin-environment'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  envDir: '../',
  plugins: [
    EnvironmentPlugin('all', { prefix: 'VUE_APP_' }),
    vue(),
  ],
  server: {
    host: true
  },
})
