#!/bin/zsh
set -e

echo "👋 Welcome to the ant-ml setup script!"

# If you're setting up conda manually, make sure to use the Mac version:
# curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
# bash Miniconda3-latest-MacOSX-x86_64.sh

# Check if environment already exists
if conda env list | grep -q '^ant-ml\s'; then
  echo "✅ Conda environment 'ant-ml' already exists."
  echo "👉 If you're reinstalling, there's usually no need to recreate the environment."
  echo "🔄 Activating existing environment..."
else
  echo "🐍 Creating new conda environment 'ant-ml' with Python 3.10..."
  conda create -n ant-ml python=3.10 pip -y
fi

# Try to source conda.sh
if [ "$CONDA_DEFAULT_ENV" != "ant-ml" ]; then
  CONDA_SH=~/miniconda3/etc/profile.d/conda.sh
  if [ ! -f "$CONDA_SH" ]; then
    echo "🚫 Could not find Conda initialization script at:"
    echo "   $CONDA_SH"
    echo "🛠️  As a workaround, you can run: conda activate ant-ml"
    echo "🛠️  then run: ./setup.sh"
    exit 1
  fi
  # Source conda
  source "$CONDA_SH"
  # Activate the environment
  conda activate ant-ml
fi

# Double-check activation
if [ "$CONDA_DEFAULT_ENV" != "ant-ml" ]; then
  echo "🚫 Failed to activate 'ant-ml' environment."
  echo "🛠️  As a workaround, you can run: conda activate ant-ml"
  echo "🛠️  then run: ./setup.sh"
  echo "🛠️  If that doesn't work, ensure Miniconda is properly initialized, then try again."
  echo "🛠️  There are instructions for installing Miniconda in README.MD"
  exit 1
fi

echo "✅ Conda environment 'ant-ml' is active."

# Install PyTorch (CPU only)
echo "📦 Installing PyTorch (CPU-only)..."
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

# Install other Python packages
echo "📦 Installing supporting packages..."
pip install timm yapf pycocotools transformers addict matplotlib

# Check if we're in the correct directory and GroundingDINO exists
if [ ! -d "GroundingDINO" ]; then
  echo "🚫 Please make sure you're running this script from the 'ant-ml' directory and that 'GroundingDINO' exists inside it."
  echo "🧭 Navigate to the correct directory, then run:"
  echo "   ./setup.sh"
  exit 1
fi

# Install GroundingDINO
echo "🔧 Installing GroundingDINO..."
cd GroundingDINO
pip install -e .
cd ..

# Download weights
echo "💾 Downloading GroundingDINO weights..."
mkdir -p GroundingDINO/weights
curl -L https://github.com/IDEA-Research/GroundingDINO/releases/download/v0.1.0-alpha/groundingdino_swint_ogc.pth \
  -o GroundingDINO/weights/groundingdino_swint_ogc.pth


