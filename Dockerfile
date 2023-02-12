FROM golang:latest AS golatest
RUN mkdir -p /go/src/pipeline
WORKDIR /go/src/pipeline
ADD main.go .
ADD go.mod /
RUN go install .

FROM alpine:latest
WORKDIR /root/
COPY --from=golatest /go/bin/pipeline .
ENTRYPOINT ./main


