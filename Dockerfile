FROM alpine:3 as builder

WORKDIR /opt/web/frontend
COPY dist .
COPY auth.conf /opt/web/

RUN chown -R 1001:1001 /opt/web/


FROM bitnami/nginx:1.23.3-debian-11-r3

ENV LANG=C.UTF-8
ENV TZ=Asia/Shanghai

WORKDIR /opt/web
COPY --from=builder /opt/web /opt/web

