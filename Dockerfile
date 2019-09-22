FROM python:3-stretch

LABEL version="1.0.0"
LABEL maintainer="Juli"
LABEL description="Install Scf Cli"

RUN sudo pip install scf

RUN echo "install scf cli successfully"

RUN scf --version

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD scf deploy -f