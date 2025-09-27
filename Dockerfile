# Latest Python slim image use karo
FROM python:3.11-slim

# System dependencies install karo
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    ffmpeg aria2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Work directory set karo
WORKDIR /app

# Python dependencies install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# App run karne ka command (apne project ke hisaab se change karo)
CMD ["python", "config.py"]
