FROM ubuntu:20.04

# Update packages
RUN apt-get update && apt-get dist-upgrade -y

# Install pip
RUN apt install -y python3-pip \
  && pip3 install --upgrade pip

# Install gunicorn through pip
RUN pip install gunicorn

# Bring in the code
COPY app.py /var/www/site/app.py

# Permissions
RUN chown -R root:www-data /var/www/site
RUN chmod -R 0750 /var/www/site

# Expose web port
EXPOSE 8080

# Add the startup script to the container
ADD startup.sh /root/startup.sh

CMD ["/bin/bash", "/root/startup.sh"]