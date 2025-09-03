FROM node:24-alpine

WORKDIR /app

RUN npm install -g create-vite

# Scaffold project ONLY if not already present
RUN test -d personal-web || npm create vite@latest personal-web -- --template react

WORKDIR /app/personal-web

# Install deps (only if package.json exists)
RUN [ -f package.json ] && npm install || true

EXPOSE 5173
CMD ["npm", "run", "dev", "--", "--host"]

