#!/bin/bash
set -e

# Install dependencies
apt-get update
apt-get install -y git python3-pip python3-venv libglib2.0-dev libsm6 libxext6 libxrender-dev

# Create ESRGAN directory
mkdir -p /opt/esrgan
cd /opt/esrgan

# Clone Real-ESRGAN repo
git clone https://github.com/xinntao/Real-ESRGAN.git
cd Real-ESRGAN

# Create virtual environment
python3 -m venv venv
source venv/bin/activate

# Install Python dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Download pre-trained model
python scripts/download_pretrained_models.py

# Deactivate venv
deactivate

echo "✅ Real-ESRGAN installation complete."
