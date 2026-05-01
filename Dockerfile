FROM ubuntu:22.04

RUN apt update && apt install -y \
    git build-essential automake libtool pkg-config \
    libcurl4-openssl-dev libjansson-dev libssl-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Clone miner (bisa dari fork kamu sendiri biar nggak direct public repo)
RUN git clone https://github.com/JayDDee/cpuminer-opt.git .

RUN ./build.sh

# Copy config & startup script
COPY config.json /app/config.json
COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

# Auto run
ENTRYPOINT ["./start.sh"]
