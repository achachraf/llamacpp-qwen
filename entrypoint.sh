#!/bin/bash
# entrypoint.sh

# Create model directory if it doesn't exist
mkdir -p "${QWEN_MODEL_PATH}"

# Download model if it doesn't exist
if [ ! -f "${QWEN_MODEL_GGUF_PATH}" ]; then
    echo "Downloading model..."
    curl -L "${GGUF_MODEL_URL}" -o "${QWEN_MODEL_GGUF_PATH}"
fi


# Start the server
exec /app/llama-server -m "${QWEN_MODEL_GGUF_PATH}" \
    --port "${LLAMA_SERVER_PORT}" \
    --host "${LLAMA_SERVER_HOST}" \
    -n "${N_CTX}" \
    -t "${THREADS}" \
    --temp "${TEMPERATURE}" \
    --top_k "${TOP_K}" \
    --top_p "${TOP_P}"