FROM python:3.12-slim

LABEL org.opencontainers.image.source=https://github.com/V-know/ChatGPT-Telegram-Group-Assistant

ARG APP_HOME=/app
WORKDIR $APP_HOME

ADD . $APP_HOME

RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package; pip install -r $APP_HOME/requirements.txt

ENTRYPOINT ["python", "main.py"]