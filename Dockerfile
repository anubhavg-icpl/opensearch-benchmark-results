FROM python:3.11-slim

# Create a non-root user
RUN useradd -m -s /bin/bash appuser \
    && mkdir -p /app \
    && chown -R appuser:appuser /app

WORKDIR /app

# Install system dependencies including git, build-essential, curl and wget
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    curl \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Install opensearch-benchmark
RUN pip install opensearch-benchmark

# Switch to non-root user
USER appuser

# Keep container running
CMD ["bash"]
