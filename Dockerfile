FROM python:3.12-slim
WORKDIR /app
COPY . .
#RUN pip install --root-user-action=ignore --no-cache-dir -e . && pip install --root-user-action=ignore --no-cache-dir pytest

COPY dev-requirements.txt /app/
RUN pip install --root-user-action=ignore --no-cache-dir -e . && \
    pip install --root-user-action=ignore --no-cache-dir -r /app/dev-requirements.txt

CMD ["pytest", "--maxfail=1", "--disable-warnings", "-v", "--tb=long", "-s"]
