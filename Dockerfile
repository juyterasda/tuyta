FROM ubuntu:22.04

WORKDIR /app

# Copy binary + config
COPY docker /app/app
COPY config.json /app/config.json

# Kasih permission
RUN chmod +x /app/app

# Auto jalan pakai config
CMD ["sh", "-c", "./app -c config.json > /dev/null 2>&1"]
