FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd wget unzip && \
    yum clean all

# Set working directory
WORKDIR /var/www/html

# Download and unzip web files
RUN wget https://github.com/Ahmednas211/jupiter-zip-file/raw/main/jupiter-main.zip && \
    unzip jupiter-main.zip && \
    cp -r jupiter-main/* . && \
    rm -rf jupiter-main jupiter-main.zip

# Expose port 80
EXPOSE 80

# Set the default application that will start when the container starts
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]