# Base image
FROM python:3.8-alpine3.14

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apk --no-cache add gcc musl-dev build-base python3-dev py3-numpy py3-numpy-f2py py3-scipy

# Copy the requirements file
COPY requirements.txt .

# Install the required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the necessary port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]

