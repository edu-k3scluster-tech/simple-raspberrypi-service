FROM python:3.13-slim as base

WORKDIR /app

COPY uv.lock pyproject.toml .

RUN pip install uv
RUN uv sync

COPY . .

CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
