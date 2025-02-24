# llamacpp-qween

## Overview

This project sets up a Dockerized version of the [`llama.cpp`](https://github.com/ggerganov/llama.cpp) server to run the Qwen model. The project automatically handles model downloading and starts the server with inference settings specified in [`.env`](.env).

## Files Overview

- **[`.env`](.env):** Defines environment variables for model paths, server settings, and inference parameters.
- **[Dockerfile](Dockerfile):** Builds the Docker image based on the official llama.cpp server image, installs necessary packages, sets up the Qwen model directory, and specifies the entrypoint.
- **[docker-compose.yaml](docker-compose.yaml):** Provides a Docker Compose service definition for running the container.
- **[entrypoint.sh](entrypoint.sh):** Ensures the model directory exists, downloads the model if missing, and starts the server.

## Environment Setup

1. **the `.env` file** is provided by default. You can modify it to suit your needs.:

    ```dotenv
    LLAMACPP_QWEN_PATH=/opt/llamacpp-qwen
    BASE_MODELS_PATH=${LLAMACPP_QWEN_PATH}/models
    QWEN_MODEL_PATH=${BASE_MODELS_PATH}/Qwen2.5-Coder-0.5B-Instruct
    QWEN_MODEL_GGUF_PATH=${QWEN_MODEL_PATH}/qwen2.5-coder-0.5b-instruct-q2_k.gguf
    GGUF_MODEL_URL="https://huggingface.co/Qwen/Qwen2.5-Coder-0.5B-Instruct-GGUF/resolve/main/qwen2.5-coder-0.5b-instruct-q2_k.gguf?download=true"
    LLAMA_SERVER_PORT=8080
    LLAMA_SERVER_HOST=0.0.0.0

    # Inference parameters
    N_CTX=512
    THREADS=4
    TEMPERATURE=0.7
    TOP_K=40
    TOP_P=0.95
    ```

These variables are suitable for running the Qwen model. You can modify them to suit your needs.

## Installation

### Clone the Repository

```sh
git clone <repository-url>
cd llamacpp-qween
```

### Run with Docker Compose

```sh
docker-compose up -d
```

### Access the Server

The server will be accessible at `http://localhost:8080`.

### Build the Docker Image

Alternatively, you can build the Docker image manually:

```sh
docker build -t achachraf/llamacpp-qwen-2.5-1.5b:1.0.0 .
```

And run with docker-compose



## Configuration with IntelliJ IDEA

1. **Open the project** in IntelliJ IDEA.

2. **Install the Continue.dev Plugin** from the IntelliJ IDEA Marketplace.

3. **Open the Continue.dev Tool Window** by clicking on the Continue.dev icon at the right side of the IDE.

4. **Open config.json File** by clicking on the `Open Config` button in the Continue.dev Tool Window.


5. **Connect to the running llamacpp-qwen server** 

To do this, we need to add two types of configurations to the `config.json` file:

- **Code completion configuration** to enable code completion for the Qwen model.

Add at the end of the file:

```json
{
   ...
  "tabAutocompleteModel": {
    "title": "Qween 2.5 0.5B Coder",
    "provider": "llama.cpp",
    "model": "qwen2.5-coder-0.5b-instruct",
    "apiBase": "http://localhost:8080"
  }
}
```

- **AI Chat configuration** to enable AI chat with the Qwen model.

Add in the `models` array:

```json
[
   ...
    {
      "title": "llama.cpp Qween 0.5B",
      "provider": "llama.cpp",
      "apiBase": "http://localhost:8080",
      "model": "qwen2.5-coder-0.5b-instruct"
    }
]
```

The configuration is the same for VSCode.