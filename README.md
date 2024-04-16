# ChatGPT Telegram Group Assistant

Ask me anything by bot command `/ask` or just replying my message directly.

## 🚀Start

```shell
python main.py | tee >> debug.log
```

### Docker build & Run

```shell
docker run --rm --name chatgpt-telegram-group-assistant -v ./config.yaml:/app/config.yaml ghcr.io/v-know/chatgpt-telegram-group-assistant:latest
```

### Docker Compose

```shell
docker-compose up -d
