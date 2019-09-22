FROM python:3-stretch

LABEL version="1.0.0"
LABEL maintainer="Juli"
LABEL description="Install Scf Cli"

RUN pip install scf

RUN echo "install scf cli successfully"

RUN scf --version


COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]

CMD ["scf"]