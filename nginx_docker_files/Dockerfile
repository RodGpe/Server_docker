FROM nginx:1.22.0
COPY ./static-html /usr/share/nginx/html
COPY ./reverse_prox_conf/default.conf     /etc/nginx/conf.d/default.conf
COPY ./reverse_prox_conf/subdomain.conf   /etc/nginx/conf.d/subdomain.conf
EXPOSE 80
EXPOSE 443
