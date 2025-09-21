FROM nikolaik/python-nodejs:python3.10-nodejs19

RUN apt-get clean
rm -rf /var/lib/apt/lists/*
apt-get update --fix-missing
apt-get install -y ffmpeg aria2

COPY . /app/
WORKDIR /app/
RUN python -m pip install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir --upgrade --requirement requirements.txt

CMD bash start
