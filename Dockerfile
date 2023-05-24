# Use the official Python image as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask app files to the working directory
COPY . .

# Expose port 5000 for the Flask app
EXPOSE 5000

# Start the Flask app when the container launches
CMD ["python", "app.py"]
