import { defineConfig } from 'vite';

export default defineConfig({
  preview: {
    host: true,
    port: 4321,
    allowedHosts: ['vps.theonix.mx'],
  },
});
