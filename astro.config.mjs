// @ts-check
import tailwind from '@astrojs/tailwind';
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  integrations: [tailwind()],
  vite: {
    preview: {
      host: true,
      port: 4321,
      allowedHosts: ['vps.theonix.mx', 'www.vps.theonix.mx', 'https://vps.theonix.mx, http://vps.theonix.mx'],
    },
  },
});

