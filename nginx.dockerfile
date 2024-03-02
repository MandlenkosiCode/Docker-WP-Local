FROM nginx:latest

ARG user
ARG uid

RUN useradd -G www-data,root -u $uid -d /home/$user $user

RUN chown -R $user:$user /var/cache/nginx && \
    chown -R $user:$user /var/log/nginx && \
    chown -R $user:$user /etc/nginx/conf.d

RUN touch /var/run/nginx.pid && \ 
    chown -R $user:$user /var/run/nginx.pid

USER $user
