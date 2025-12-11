FROM ubuntu:24.04

RUN sysctl -w net.ipv4.ip_forward=1
RUN sysctl net.ipv4.ip_forward

CMD ["tail", "-f", "/dev/null"]