FROM ubuntu:24.04

WORKDIR /app

RUN apt update && apt install -y python3-full python3-venv iproute2 

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

RUN pip install flask  && pip install mysql-connector-python


COPY app.py .

RUN apt install -y curl tar
RUN curl -L -o exporter.tar.gz https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz
RUN tar -xzf exporter.tar.gz && mv node_exporter-1.10.2.linux-amd64 exporter

RUN chmod +x ./exporter/node_exporter

CMD sh -c "./exporter/node_exporter & flask run --host=0.0.0.0"

