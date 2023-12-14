# Stage 1: Build the Flutter app
FROM ghcr.io/cirruslabs/flutter:3.10.5 AS build

# Set the working directory to /app
WORKDIR /app

# Copy the entire Flutter project to the container
COPY . .

# Run the necessary Flutter commands to build the app
RUN flutter pub get && \
    flutter packages pub run build_runner build --delete-conflicting-outputs && \
    flutter build web --release

# Stage 2: Create a minimal image to run the built app
FROM nginx:stable-alpine3.17

# Add permissions
RUN chown -R nginx:nginx /var/cache/nginx && \
    mkdir /tmp/nginx && \
    chown -R nginx:nginx /tmp/nginx && \
    touch /var/run/nginx.pid && \
    chown nginx:nginx /var/run/nginx.pid

USER nginx

# Copy the built app from the previous stage to the nginx html directory
COPY --from=build --chown=nginx:nginx /app/build/web /usr/share/nginx/html

# Expose port 80 for the web server to listen on
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
