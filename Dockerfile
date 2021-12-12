FROM golang:alpine
RUN go install github.com/blockassets/cgminer_exporter@latest
EXPOSE 4030
ENV CGHOST=127.0.0.1
CMD /go/bin/cgminer_exporter -cghost $CGHOST