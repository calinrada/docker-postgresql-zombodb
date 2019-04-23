FROM postgres:10.7

ENV DEBIAN_FRONTEND noninteractive
ENV DOWNLOAD_URL https://www.zombodb.com/releases/v10-1.0.3/zombodb_jessie_pg10-10-1.0.3_amd64.deb


RUN apt update
RUN apt install wget curl postgresql-10-postgis-2.5 postgresql-10-pgrouting -y
RUN wget $DOWNLOAD_URL
RUN dpkg -i zombodb_jessie_pg10-10-1.0.3_amd64.deb
