FROM python:3.11-slim

# Install system dependencies (git, build tools, ffmpeg, etc.)
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    ffmpeg aria2 git build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel && \
    pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Start the app using config.py
CMD ["python", "config.py"]
