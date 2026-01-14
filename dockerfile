# Use a lightweight base image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy dependency file first (for caching)
COPY requirements.txt .

# Upgrade pip & install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app.py .
COPY templates templates
COPY static static

# Expose Flask port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
