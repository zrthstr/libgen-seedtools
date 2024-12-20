FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

ADD . /app

WORKDIR /app

RUN uv sync --frozen
RUN uv build
ENV PATH="/app/.venv/bin:$PATH"

CMD ["pytest", "--maxfail=1", "--disable-warnings", "-v", "--tb=long", "-s"]
