import os
import argparse
import sys; sys.path.append("GroundingDINO")
from groundingdino.util.inference import load_model, load_image, predict, annotate
import supervision as sv
import cv2
from tqdm import tqdm


model = load_model("GroundingDINO/groundingdino/config/GroundingDINO_SwinT_OGC.py", "GroundingDINO/weights/groundingdino_swint_ogc.pth")


def segment_ants(input_folder, output_folder, text_prompt, box_threshold, text_threshold, device="cpu"):
    for image_path in tqdm(sorted(os.listdir(input_folder))):
        image_raw, image_pt = load_image(os.path.join(input_folder, image_path))
        boxes, logits, phrases = predict(
            model=model,
            image=image_pt,
            caption=text_prompt,
            box_threshold=box_threshold,
            text_threshold=text_threshold,
            device=device
        )
        annotated_frame = annotate(image_source=image_raw, boxes=boxes, logits=logits, phrases=phrases)
        num_ants = len(boxes)
        input_filename = os.path.splitext(image_path)[0]
        output_filename = f"{input_filename}_{num_ants}ants.png"
        cv2.imwrite(os.path.join(output_folder, output_filename), annotated_frame)


if __name__ == "__main__":
    # Set up commandline arguments
    parser = argparse.ArgumentParser()
    parser.add_argument("--input_folder", default="input_images", type=str)
    parser.add_argument("--output_folder", default="output_images", type=str)
    parser.add_argument("--text_prompt", default="ant", type=str)
    parser.add_argument("--box_threshold", default=0.20, type=float)
    parser.add_argument("--text_threshold", default=0.20, type=float)
    args = parser.parse_args()

    # Check if input folder exists
    if not os.path.exists(args.input_folder):
        raise FileNotFoundError(f"Input folder {args.input_folder} does not exist")

    # Check if output folder exists
    if not os.path.exists(args.output_folder):
        os.makedirs(args.output_folder)

    segment_ants(args.input_folder, args.output_folder, args.text_prompt, args.box_threshold, args.text_threshold)
