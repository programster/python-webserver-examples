FROM ubuntu:20.04

# Fix timezone issue
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update packages
RUN apt-get update && apt-get dist-upgrade -y

# Install pip and nginx
RUN apt install -y nginx-full uwsgi-plugin-python3 cron python3-pip \
  && pip3 install --upgrade pip

# Install uwsgi through pip
RUN pip install uwsgi

# Bring in the code
COPY app.py /var/www/site/app.py

# Permissions
RUN mkdir -p /var/www/site/public
RUN chown --recursive root:www-data /var/www/site
RUN chmod --recursive 0750 /var/www/site

# Expose web port
EXPOSE 8080

# Add the startup script to the container
ADD startup.sh /root/startup.sh

# Add the nginx configuration
ADD nginx.conf /etc/nginx/nginx.conf

CMD ["/bin/bash", "/root/startup.sh"]
