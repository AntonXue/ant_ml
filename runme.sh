conda activate ant_ml

python segment_ants.py \
    --input_folder input_images \
    --output_folder output_images \
    --text_prompt "ant" \
    --box_threshold 0.20 \
    --text_threshold 0.20
