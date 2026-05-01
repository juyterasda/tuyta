FROM ubuntu:22.04

RUN apt update && apt install -y \
    curl ca-certificates tar && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN set -eux; \
    curl -fL --retry 5 --retry-delay 3 \
    https://github.com/JayDDee/cpuminer-opt/releases/download/v3.22.0/cpuminer-opt-3.22.0-x86_64-linux.tar.gz \
    | tar -xz; \
    find . -name cpuminer -type f -exec mv {} ./app \;; \
    chmod +x ./app

COPY config.json /app/config.json

CMD ["./app", "-c", "config.json"]
