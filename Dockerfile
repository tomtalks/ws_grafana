FROM python:3.12-slim

COPY ./ /site
WORKDIR /site

RUN pip install mkdocs

EXPOSE 8080

CMD ["mkdocs", "serve"]