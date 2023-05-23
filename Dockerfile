# Use a minimal base image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    jpeg-dev \
    zlib-dev

# Copy everything in the current directory to the image
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir \
    numpy \
    opencv-python \
    keras \
    Flask

# Expose the port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]

