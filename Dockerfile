# Use full Python image instead of slim
FROM python:3.10

# Avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install git (if needed)
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your project into the image
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start your bot
CMD ["python", "bot.py"]
