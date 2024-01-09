FROM golang:1.14.4 AS builder
ADD ./ /root/whaler_build
WORKDIR /root/whaler_build
RUN export CGO_ENABLED=0 && go build .
RUN cp whaler /root/whaler

FROM alpine
WORKDIR /root/
COPY --from=builder /root/whaler .
ENTRYPOINT ["./whaler"]
