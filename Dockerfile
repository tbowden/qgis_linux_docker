FROM ubuntu:bionic

RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update

# Need to consolidate all these run commands once I've stopped making so
# many changes
RUN apt-get install -y vim ipython3 python3-dev units

RUN apt-get install -y wget gpg

RUN wget -O - https://qgis.org/downloads/qgis-2019.gpg.key | apt-key add - && \
    echo 'deb https://qgis.org/ubuntugis bionic main' >> /etc/apt/sources.list.d/qgis && \
    echo 'deb-src https://qgis.org/ubuntugis bionic main' >> /etc/apt/sources.list.d/qgis

RUN apt-get update
RUN    apt-get install -y qgis qgis-plugin-grass qgis-server
# RUN rm -rf /var/lib/apt/lists/*

# docker build -t qgis_3.12:1 -t qgis_3.12:latest .

# Make sure we don't run as root. --user arg should be passed with
# docker run instead to run qgis as the user launching the container
# See 'start_docker_qgis' script for expected args

USER nobody

