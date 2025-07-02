FROM node:20-alpine AS builder
WORKDIR /app
COPY . .
COPY vite.config.js ./
RUN npm install && npm run build

FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/vite.config.js ./vite.config.js

EXPOSE 4321
CMD ["npx", "astro", "preview", "--host", "--port", "4321"]
