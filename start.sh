#!/bin/sh
set -e

# Start Nginx
nginx

# Start PHP-FPM
php-fpm8.2 -F

# Keep the container running
tail -f /dev/null
