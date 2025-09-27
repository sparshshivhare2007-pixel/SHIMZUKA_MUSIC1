FROM python:3.11-slim

# Install system dependencies (git, build tools, etc.)
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    ffmpeg aria2 git build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Start the app (change if your entry file is not main.py)
CMD ["python", "config.py"]
