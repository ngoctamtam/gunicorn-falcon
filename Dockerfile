FROM python:3.6

# install  supervisor

RUN apt-get update && \
    apt-get install -y supervisor

COPY . /project

WORKDIR /project

RUN pip install -r requirements.txt

# Set up configuration files
ADD /docker_config/supervisor_app.conf /etc/supervisor/supervisord.conf

VOLUME ["/project","/tmp","/etc/supervisor/"]
EXPOSE 5000

CMD ["supervisord", "-n"]

