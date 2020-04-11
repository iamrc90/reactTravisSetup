FROM node:alpine as IBuild
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=IBuild /app/build /usr/share/nginx/html 