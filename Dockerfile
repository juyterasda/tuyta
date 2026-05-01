FROM ubuntu:22.04

RUN apt update && apt install -y \
    git build-essential automake libtool pkg-config \
    libcurl4-openssl-dev libjansson-dev libssl-dev \
    libgmp-dev nasm && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/JayDDee/cpuminer-opt.git .

# Kadang perlu init dulu
RUN ./autogen.sh || true

RUN ./build.sh

COPY config.json /app/config.json
COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

ENTRYPOINT ["./start.sh"]
