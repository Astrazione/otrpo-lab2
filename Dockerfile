FROM python:3.12-slim

RUN apt-get update && apt-get install -y \
    libopencv-dev \
    python3-opencv \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /face_detection
COPY face_detector.py .
COPY default_image.jpg source/.

RUN pip install --no-cache-dir opencv-python-headless

CMD ["python", "face_detector.py"]