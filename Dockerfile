FROM python:3.12-slim
WORKDIR /app
COPY . .
RUN pip install --root-user-action=ignore --no-cache-dir -e . && pip install --root-user-action=ignore --no-cache-dir pytest
#CMD ["pytest", "tests"]
CMD ["pytest", "--maxfail=1", "--disable-warnings", "-v", "--tb=long", "-s"]
#CMD ["pytest", "--maxfail=1", "-v" ]
#CMD ["sh", "-c", "pytest --maxfail=1 --disable-warnings -v --capture=no --tb=short"]


