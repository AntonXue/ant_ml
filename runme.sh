#!/bin/zsh
echo "👋 We're going to run ant-ml!"


# Check if conda is installed
if ! command -v conda &> /dev/null; then
  echo "🚫 Conda is not installed."
  echo "👉 Please follow all the first-time setup instructions in README.md"
  exit 1
fi

# Try to source conda.sh
if [ "$CONDA_DEFAULT_ENV" != "ant-ml" ]; then
    CONDA_SH=~/miniconda3/etc/profile.d/conda.sh
    if [ ! -f "$CONDA_SH" ]; then
    echo "🚫 Could not find Conda initialization script at:"
    echo "   $CONDA_SH"
    echo "🛠️  As a workaround, you can run: conda activate ant-ml"
    echo "🛠️  then run: ./runme.sh"
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
  echo "🛠️  then run: ./runme.sh"
  echo "🛠️  If that doesn't then make sure you ran all the first-time setup instructions in README.md"
  exit 1
fi


python segment_ants.py \
    --input_folder input_images \
    --output_folder output_images \
    --text_prompt "ant" \
    --box_threshold 0.20 \
    --text_threshold 0.20
