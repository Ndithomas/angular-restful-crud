# Stage 1: Build the Angular app
FROM node:20 AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build -- --configuration=production

# Stage 2: Serve via Nginx
FROM nginx:alpine
# Note: In Angular 17+, the build output defaults to dist/<project-name>/browser
COPY --from=build /app/dist/angular_restful-crud /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]