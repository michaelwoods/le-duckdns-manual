FROM python:alpine

RUN apk --no-cache --update add bash curl openssl libffi \
&& apk --no-cache --update --virtual build-dependencies add libffi-dev openssl-dev python-dev build-base \
&& pip install certbot certbot-external-auth


WORKDIR dns
COPY . .

ENTRYPOINT ["bash", "scripts/dns.sh"]
