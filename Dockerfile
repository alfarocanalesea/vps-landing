FROM node:20-alpine AS builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM node:20-alpine AS runner
WORKDIR /app

COPY --from=builder /app/dist ./dist
RUN npm install -g serve
EXPOSE 4321
CMD ["serve", "-s", "dist", "-l", "4321"]
