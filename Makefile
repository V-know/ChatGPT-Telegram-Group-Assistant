# 定义变量
VENV := venv
PYTHON := $(VENV)/bin/python
PIP := $(VENV)/bin/pip
REQUIREMENTS := requirements.txt

# 定义默认目标
.DEFAULT_GOAL := help

# 创建虚拟环境
$(VENV)/bin/activate: requirements.txt
	python3 -m venv $(VENV)
	$(PIP) install -r $(REQUIREMENTS)

# 安装依赖项
install: $(VENV)/bin/activate

# 运行应用程序
run: $(VENV)/bin/activate
	$(PYTHON) main.py

image: $(VENV)/bin/activate
	docker buildx build --platform linux/amd64 . -t ghcr.io/v-know/chatgpt-telegram-group-assistant:latest
	docker push ghcr.io/v-know/chatgpt-telegram-group-assistant:latest

	docker buildx build --platform linux/arm64 . -t ghcr.io/v-know/chatgpt-telegram-group-assistant:arm64-latest
	docker push ghcr.io/v-know/chatgpt-telegram-group-assistant:arm64-latest

# 显示帮助信息
help:
	@echo "Available targets:"
	@echo "  install   安装依赖项"
	@echo "  run       运行应用程序"
	@echo "  test      运行测试"
	@echo "  docs      构建文档"
	@echo "  clean     清理虚拟环境和构建文件"