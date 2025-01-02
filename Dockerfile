FROM python:3.12-slim

LABEL org.opencontainers.image.source=https://github.com/V-know/ChatGPT-Telegram-Group-Assistant

ARG APP_HOME=/app
WORKDIR $APP_HOME

ADD . $APP_HOME

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install cryptography \
    && pip install -r $APP_HOME/requirements.txt \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ENTRYPOINT ["python", "main.py"]
