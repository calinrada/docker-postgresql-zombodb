# Pull base image.
FROM postgres:9.5
ENV ZOMBODB_VER 5.6.4-1.0.17

# Fetch wget
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/*
RUN apt-get update -y -qq --fix-missing
RUN apt-get install -y curl

# Install zombo
RUN \
  cd / && \
  mkdir zombodb && \
  cd zombodb && \
  wget https://www.zombodb.com/releases/v${ZOMBODB_VER}/zombodb_jessie_pg95-${ZOMBODB_VER}_amd64.deb
RUN \
  cd /zombodb && \
  dpkg -i zombodb_jessie_pg95-${ZOMBODB_VER}_amd64.deb

COPY docker-entrypoint.sh /

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["postgres"]

