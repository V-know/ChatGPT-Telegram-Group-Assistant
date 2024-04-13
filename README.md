# ChatGPT Telegram Group Assistant

## 🚀Start

```shell
python main.py | tee >> debug.log
```

### Docker build & Run

```shell
docker run --rm --name chatgpt-telegram-bot -v ./config.yaml:/app/config.yaml ghcr.io/v-know/chatgpt-telegram-group-assistant:latest
```

### Docker Compose

```shell
docker-compose up -d
