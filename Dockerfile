# Use a minimal base image
FROM python:3.9-alpine

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache \
    build-base \
    jpeg-dev \
    zlib-dev

# Copy only the requirements file first
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the remaining app files
COPY . .

# Expose the port
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
