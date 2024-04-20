FROM node:21.7.3 as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build

FROM nginx:latest
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
COPY --from=builder /app/build .
ENTRYPOINT ["nginx", "-g", "daemon off;"]