FROM golang:alpine3.15 AS builder
WORKDIR /app
COPY main.go .
RUN go build -o main main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD ["/app/main"]