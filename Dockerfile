# Use Alpine base image with Python
FROM python:3.9-alpine

# Update packages and install necessary dependencies
RUN apk update && apk add --no-cache \
    build-base \
    cmake \
    openblas-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    freetype-dev \
    libwebp-dev \
    tiff-dev \
    openssl-dev \
    zlib-dev \
    jpeg-dev

# Install OpenCV
RUN apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    make \
    && pip install --no-cache-dir opencv-python-headless \
    && apk del .build-deps

# Set the working directory
WORKDIR /app

# Copy only the necessary files for the Flask app
COPY app.py .
COPY templates templates/

# Install Python dependencies
RUN pip install --no-cache-dir flask keras

# Expose the application port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]
