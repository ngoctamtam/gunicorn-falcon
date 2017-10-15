# docker-gunicorn-falcon
mkdir -p /project/api/  /project/log  /project/supervisor

vim /project/supervisor/supervisord.conf

[supervisord]
nodaemon = true
logfile = /var/log/supervisord.log
pidfile = /var/run/supervisord.pid

[program:project]
autorestart = true
command = gunicorn --chdir /project/api -w 2 -b 0.0.0.0:5000 m



docker run -d --name gunicorn -v /project:/project -v /project/log:/tmp -v /project/supervisor:/etc/supervisor -p 5000:5000 gunicorn-falcon

