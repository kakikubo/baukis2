import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(['config/routes.rb', 'app/views/**/*'], { delay: 100 })
  ],
  build: {
    outDir: 'public/packs',
    manifest: true,
    rollupOptions: {
      input: 'app/frontend/packs/application.mjs'
    }
  },
  server: {
    proxy: {
      '/rails': {
        target: 'http://localhost:3000',
        changeOrigin: true
      }
    }
  }
})
