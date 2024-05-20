# ChatGPT Telegram Group Assistant

Ask me anything by bot command `/ask` or just replying my message directly.

## 🤖Quick Experience

Telegram Bot: [卧龙凤雏](https://t.me/WoLongFengChuBot)

## ⚙️Preparation

Prepare the configuration file `config.yaml`:

[All the required configurations are in config.yaml, please refer to config.yaml.example for file format and content.](https://github.com/V-know/ChatGPT-Telegram-Bot/blob/main/README.md#add-configuration)
```shell
cp config.yaml.example config.yaml
```

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
