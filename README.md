# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to note:

* Ruby version - 3.1.2
* Rail version - 7.0.4.2

* cp .example.env .env


* Install Docker - (https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
* Graylog Setup -  (https://go2docs.graylog.org/5-0/downloading_and_installing_graylog/docker_installation.htm)

* Run the docker-compose.yml by using cmd 'sudo docker-compose up'

* Login to graylog (username: admin, password: 'GRAYLOG_PASSWORD_SECRET')

* (http://127.0.0.1:9000/system/inputs) -> set inputs -> GELF UDP -> Click Launch New Input -> enter title -> Click Launch Input
* (http://127.0.0.1:9000/system/inputs) -> set inputs -> GELF HTTP -> Click Launch New Input -> enter title -> Click Launch Input

