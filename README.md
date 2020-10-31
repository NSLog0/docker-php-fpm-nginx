![php](https://github.com/NSLog0/docker-php-fpm-nginx/blob/master/.temp/php.png) 
![docker](https://github.com/NSLog0/docker-php-fpm-nginx/blob/master/.temp/docker.png)

This repo use for create a development env for PHP developer

# Roughly details (I will update later)

1. put your code to src/
2. run docker-compose up
3. go to `localhost:8080`

if you want to open the php-extension go to edit `.docker/fpm.dockerfile` file and add a extension to `docker-php-ext-install`

if you want to update the nginx config go to `.docker/nginx.dockerfile`
