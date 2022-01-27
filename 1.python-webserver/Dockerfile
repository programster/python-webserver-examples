FROM ubuntu:20.04

# Update packages
RUN apt-get update && apt-get dist-upgrade -y

# Install python
RUN apt-get install -y python3

# Bring in the code
COPY app.py /var/www/site/app.py

# Permissions
RUN chown -R root:www-data /var/www/site
RUN chmod -R 0750 /var/www/site

# Expose web port
EXPOSE 8080

CMD ["python3", "/var/www/site/app.py"]