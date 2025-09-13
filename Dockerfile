FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod tidy
RUN go build -o teldrive .

FROM alpine:latest
WORKDIR /root/
EXPOSE 8080
COPY --from=builder /app/teldrive .
CMD ["./teldrive"]
