# AIO Wordpress for Docker

This repository contains Docker Compose and Dockerfile configurations for creating a containerized WordPress application with PHP 8.2 and Nginx. The Docker Compose file creates multiple containers for WordPress, MySQL, and Nginx, while the Dockerfile builds a single image that includes PHP, Nginx, and WordPress.

## Compose File

This Docker Compose file creates a container with PHP 8.2, Nginx, and WordPress. The wordpress container uses the official WordPress image and runs on the db container to access the MySQL database. The nginx container runs as a reverse proxy for the wordpress container, forwarding requests to port 8080 to the wordpress container.

### Packages

[**WordPress**](https://github.com/docker-library/wordpress): An open-source software used for creating websites and blogs. WordPress is run in its own container.

[**MySQL**](https://github.com/docker-library/mysql): An open-source database used for storing WordPress data. MySQL is run in its own container.

[**Nginx**](https://github.com/nginxinc/docker-nginx): A web server and reverse proxy used to access WordPress via ports 80 and 443.

### Ports

| Port | Usage                                                                                              |
| ---- | -------------------------------------------------------------------------------------------------- |
| 80   | Used by Nginx to forward HTTP requests to the WordPress container.                                 |
| 443  | Used by Nginx to forward HTTPS requests to the WordPress container.                                |
| 8080 | Used by the WordPress container to receive HTTP requests from Nginx and access the MySQL database. |

### Usage

1. Make sure Docker is installed on your computer.
2. Download the Docker Compose file and save it in a directory on your computer.
3. Open a terminal and navigate to the directory where you saved the Docker Compose file.
4. Run `docker-compose up -d` to start the containers.
5. Open your web browser and navigate to the address http://localhost to start WordPress.
6. Follow the instructions to configure WordPress and create your blog or website.

---

## Dockerfile

This Dockerfile creates an image with PHP 8.2, Nginx, and WordPress. The image also includes Composer for installing WordPress and an Nginx configuration file for running Nginx as a reverse proxy for PHP-FPM.

### Packages

**WordPress**: An open-source software used for creating websites and blogs.

**PHP**: A scripting language used for executing WordPress code.

**Nginx**: A web server and reverse proxy used to access WordPress via port 80.

### Ports

| Port | Usage                                                              |
| ---- | ------------------------------------------------------------------ |
| 80   | Used by Nginx to forward HTTP requests to the WordPress container. |

### Usage

1. Make sure Docker is installed on your computer.
2. Download the Dockerfile and Nginx configuration file and save them in a directory on your computer.
3. Open a terminal and navigate to the directory where you saved the Dockerfile and configuration file.
4. Run `docker build -t my-wordpress .` to build the Docker image.
5. Run `docker run -p 80:80 -d my-wordpress` to start the container.
6. Open your web browser and navigate to the address http://localhost to start WordPress.
7. Follow the instructions to configure WordPress and create your blog or website.
