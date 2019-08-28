FROM ubuntu:18.04 as dev

# Use ubuntugis unstable
RUN apt-get update && apt-get install -y --no-install-recommends \
  gnupg \
  gosu \
  python3 python3-dev \
  software-properties-common \
  tzdata \
  vim \
  && add-apt-repository ppa:ubuntugis/ubuntugis-unstable \
  && apt-key adv --keyserver keyserver.ubuntu.com --recv-key 51F523511C7028C3 \
  && echo 'deb https://qgis.org/ubuntugis bionic main' >> /etc/apt/sources.list.d/qgis.list \
  && echo 'deb-src https://qgis.org/ubuntugis bionic main' >> /etc/apt/sources.list.d/qgis.list \
  && apt-get update 
RUN  apt-get install --no-install-recommends qgis -y
#RUN rm -rf /var/lib/apt/lists/*

# Make sure we don't run as root. --user arg should be passed with
# docker run instead to run qgis as the user launching the container
# See 'start_docker_qgis' script for expected args

USER nobody

