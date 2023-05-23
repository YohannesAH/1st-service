
# Use a minimal base image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Install system dependencies and build tools
RUN apk add --no-cache \
    build-base \
    cmake \
    jpeg-dev \
    zlib-dev

# Update pip to the latest version
RUN pip install --no-cache-dir --upgrade pip

# Install opencv-python-headless with specific flags
RUN pip install --no-cache-dir --force-reinstall --no-binary :all: opencv-python-headless

# Copy everything in the current directory to the image
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir \
    numpy \
    keras \
    Flask

# Expose the port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]

