# Use lightweight Nginx image
FROM nginx:alpine

# Copy E-Commerce website into Nginx web directory
COPY app/index.html /usr/share/nginx/html/index.html

# Expose HTTP port
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
