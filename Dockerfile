FROM ghcr.io/ggml-org/llama.cpp:server

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/llamacpp-qwen/models

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE ${LLAMA_SERVER_PORT}

ENTRYPOINT ["/entrypoint.sh"]