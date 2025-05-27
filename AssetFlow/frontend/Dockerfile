# frontend/Dockerfile

# Stage 1: Build the React application
FROM node:20-alpine as builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock)
COPY frontend/package.json frontend/yarn.lock* ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the rest of the application code
COPY frontend/ ./

# Build the React app
RUN yarn build

# Stage 2: Serve the built application with Nginx
FROM nginx:alpine

# Copy the built React app from the builder stage
COPY --from=builder /app/build /usr/share/nginx/html

# Copy custom Nginx configuration (optional, but good for single-page apps)
# Create frontend/nginx.conf if you want to customize Nginx
COPY frontend/nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80 (default for Nginx)
EXPOSE 80

# Command to start Nginx
CMD ["nginx", "-g", "daemon off;"]