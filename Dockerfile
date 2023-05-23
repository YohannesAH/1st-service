# Use Alpine as the base image
FROM alpine:3.14

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache python3-dev py3-pip build-base libffi-dev openssl-dev \
    && pip3 install --no-cache-dir --upgrade pip

# Install pre-built OpenCV packages
RUN apk add --no-cache opencv

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the Flask app files
COPY . .

# Expose the port
EXPOSE 5000

# Start the Flask application
CMD ["python3", "app.py"]
