FROM node:alpine as IBuild
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
EXPOSE 80
COPY --from=IBuild /app/build /usr/share/nginx/html 