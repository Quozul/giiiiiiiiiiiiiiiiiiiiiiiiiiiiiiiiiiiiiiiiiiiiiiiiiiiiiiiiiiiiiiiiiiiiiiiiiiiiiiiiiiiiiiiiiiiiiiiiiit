FROM node:18-alpine AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

FROM node:18-alpine AS runner

WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

CMD node src/index.js