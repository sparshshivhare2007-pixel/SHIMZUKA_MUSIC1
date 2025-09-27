FROM python:3.11-slim

# Install system dependencies (git added)
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    ffmpeg aria2 git build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Workdir set
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Start app (change according to your entry file)
CMD ["python", "main.py"]
