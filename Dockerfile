  FROM golang:1.16-alpine AS builder

  WORKDIR /app
  COPY . .

  RUN go mod download
  RUN go build -o teldrive .

  FROM alpine:latest

  WORKDIR /root/
  COPY --from=builder /app/teldrive .
  COPY --from=builder /app/config.toml .

  CMD ["./teldrive"]
