FROM python:3.12-alpine

WORKDIR /app

COPY . .

RUN pip install "fastapi[standard]"
RUN pip install jinja2

ENV NAME=Hayagreevan
CMD [ "fastapi","run","app.py" ]