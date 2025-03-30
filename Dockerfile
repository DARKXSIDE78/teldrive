FROM golang:1.23-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN go build -o teldrive .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/teldrive .
CMD ["./teldrive"]
