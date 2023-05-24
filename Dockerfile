# Use Alpine base image with Python
FROM python:3.9-alpine

# Update packages and install necessary dependencies
RUN apk update && apk add --no-cache \
    build-base \
    libffi-dev \
    openssl-dev \
    zlib-dev \
    jpeg-dev \
    openblas-dev \
    libwebp-dev \
    tiff-dev \
    libpng-dev \
    freetype-dev \
    libjpeg \
    libjpeg-turbo-dev \
    openjpeg-dev \
    py3-numpy-dev \
    py3-numpy \
    py3-pillow \
    py3-cython \
    cmake

# Install OpenCV
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    make \
    cmake \
    g++ \
    && pip install --no-cache-dir opencv-python-headless \
    && apk del .build-deps

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]


