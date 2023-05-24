# Use frolvlad/alpine-python3 as the base image
FROM frolvlad/alpine-python3

# Set the working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the Flask app files
COPY . .

# Expose the port
EXPOSE 5000

# Start the Flask application
CMD ["python3", "app.py"]

