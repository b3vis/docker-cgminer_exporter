FROM golang:alpine AS builder
RUN go install github.com/blockassets/cgminer_exporter@latest
FROM alpine:3.15
COPY --from=builder /go/bin/cgminer_exporter /usr/local/bin/cgminer_exporter
EXPOSE 4030
ENV CGHOST=127.0.0.1
RUN adduser -D -H cgminer_exporter
USER cgminer_exporter
CMD /usr/local/bin/cgminer_exporter -cghost $CGHOST
