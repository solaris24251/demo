FROM golang AS builder
WORKDIR /src
COPY src .
RUN CGO_ENABLED=0 go build -o app

# dfg
FROM alpine:latest
ADD ./html html
COPY --from=builder /src/app .
ENTRYPOINT ["/app"]
EXPOSE 8080