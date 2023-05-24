
# Use an official Python runtime as the base image
FROM python:3.8-alpine

# Set the working directory in the container
WORKDIR /app

# Install system dependencies for OpenCV
RUN apk --no-cache add build-base jpeg-dev zlib-dev libwebp-dev

# Install Miniconda and add it to the system PATH
RUN wget -qO /tmp/miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/sh /tmp/miniconda.sh -bfp /usr/local && \
    rm -rf /tmp/miniconda.sh && \
    export PATH="/usr/local/bin:$PATH" && \
    conda update -n base -c defaults conda && \
    conda create -y --name myenv python=3.8 && \
    conda activate myenv && \
    conda install -y -c conda-forge opencv

# Copy the requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Expose the port that the Flask app will listen on
EXPOSE 5000

# Start the Flask application
CMD ["python", "app.py"]
