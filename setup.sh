# Download and setup conda, if necessary
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# bash Miniconda3-latest-Linux-x86_64.sh

# Make new conda environment with Python 3.10
conda create -n ant_ml python=3.10

# Activate the environment
conda activate ant_ml

# Install PyTorch in CPU-only mode
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# First install PyTorch in CPU-only mode
pip3 install torch==2.6.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Install a few others
pip install timm yapf pycocotools transformers addict matplotlib -y

# Install GroundingDINO
cd GroundingDINO
pip install -e .
cd ..

# Download weights
mkdir -p GroundingDINO/weights
wget -q https://github.com/IDEA-Research/GroundingDINO/releases/download/v0.1.0-alpha/groundingdino_swint_ogc.pth -P GroundingDINO/weights/
