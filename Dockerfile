FROM training/docker-present

MAINTAINER Jim Van Fleet <jim.van.fleet@levvel.io>

COPY present/prompt.sh /bin/prompt

# default presentation repository
# Note: Switching to 'ARG' as soon as the Docker Hub stack supports '--build-args'
RUN cd /opt/revealjs/src && \
    git remote add bigfleet https://github.com/bigfleet/presentations &&  \
    git fetch bigfleet && \
    git checkout -b bigfleet-master bigfleet/master

ENTRYPOINT ["/bin/prompt"]
