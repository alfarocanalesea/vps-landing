# Dockerfile para Astro con preview expuesto correctamente
FROM node:20-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules

EXPOSE 4321

# Este comando expone preview a todo el mundo (0.0.0.0)
CMD ["npx", "astro", "preview", "--host", "--port", "4321"]
