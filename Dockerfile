FROM python:3.12-slim

COPY ./ /site
WORKDIR /site

RUN pip install mkdocs
RUN pip install -r requirements.txt

EXPOSE 8080

CMD ["mkdocs", "serve","--dev-addr=0.0.0.0:8000"]