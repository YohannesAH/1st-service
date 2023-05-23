# Use the lightweight Alpine base image
FROM alpine:3.14

# Set the working directory in the container
WORKDIR /app

# Install Python and necessary dependencies
RUN apk add --no-cache python3 py3-pip

# Copy the requirements file to the container
COPY requirements.txt .

# Install the Python dependencies
RUN apk add --no-cache --virtual .build-deps gcc musl-dev \
    && python3 -m pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps

# Copy the necessary files to the container
COPY . .

# Expose the port on which the Flask app will run
EXPOSE 5000

# Start the Flask app
CMD ["python3", "app.py"]
