FROM python:3.12-alpine

WORKDIR /app

RUN pip install flask

COPY app.py .

CMD [ "flask","run","--host=0.0.0.0" ]
