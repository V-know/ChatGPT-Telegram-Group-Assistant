from config import token
from db.MySqlConn import config
from ai.openai import OpenAIClient
from ai.azure import AzureAIClient
from ai import OPENAI_CHAT_COMPLETION_OPTIONS


def init_client():
    if config["AI"]["TYPE"] == "azure":
        client = AzureAIClient()
    else:
        client = OpenAIClient()
    return client


async def ChatCompletionsAI(logged_in_user, messages, is_from_vip_group) -> (str, str):
    level = logged_in_user.get("level")

    ai = init_client()
    answer = ""
    with ai.client.chat.completions.with_streaming_response.create(
            messages=messages,
            max_tokens=token if not is_from_vip_group else 3600,
            **OPENAI_CHAT_COMPLETION_OPTIONS) as response:
        for r in response.parse():
            if r.choices:
                delta = r.choices[0].delta
                if delta.content:
                    answer += delta.content
                yield answer, r.choices[0].finish_reason