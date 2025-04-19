# Use official PyTorch image with CUDA support
FROM pytorch/pytorch:2.5.1-cuda12.1-cudnn9-runtime

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Install system packages
RUN apt-get update && apt-get install -y \
    git \
    curl \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the entire project
COPY . .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Optional: expose port if using Jupyter later
EXPOSE 8888

# Default command to run the fine-tuning
ENTRYPOINT ["python", "fine_tune.py"]
