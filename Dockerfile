# Use a minimal base image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    jpeg-dev \
    zlib-dev

# Update pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Copy everything in the current directory to the image
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir \
    numpy \
    opencv-python-headless \
    keras \
    Flask

# Expose the port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]


