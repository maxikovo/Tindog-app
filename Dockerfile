FROM nginx:latest
COPY . /usr/share/nginx/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
