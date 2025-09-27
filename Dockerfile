FROM nikolaik/python-nodejs:python3.10-nodejs19

# Update, install packages, clean cache in one RUN to reduce layers & image size
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends ffmpeg aria2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app/

# Copy only requirements first for better caching
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN python -m pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir --upgrade -r requirements.txt

# Copy the rest of the app
COPY . .

# Start command
CMD ["bash", "start"]
