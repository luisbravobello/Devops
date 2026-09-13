FROM node:22-alpine AS runner
WORKDIR /app
COPY package.json ./
COPY app.js ./
USER node
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:3000/healthz || exit 1
CMD ["node", "app.js"]
