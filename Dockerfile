FROM ghcr.io/tgdrive/teldrive:latest
EXPOSE 8080
COPY config.toml /app/config.toml
CMD ["teldrive", "run", "-c", "/app/config.toml", "--listen", "0.0.0.0:8080"]
