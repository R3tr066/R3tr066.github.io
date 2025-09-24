FROM node:24-alpine

WORKDIR /app


COPY personal-web/package*.json ./

RUN npm install

COPY personal-web ./

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]
