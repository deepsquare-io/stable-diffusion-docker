# Stable Diffusion in Docker

## Build

```shell
docker build -t localhost/library/stable-diffusion:latest .
```

## Prepare models

You can downloads models checkpoints on [Huggingface](https://huggingface.co/models?other=stable-diffusion).

And configs file on the official [Stable Diffusion Github page](https://github.com/Stability-AI/stablediffusion).

## How to run

Put the models and checkpoint in a `models` directory. Create a `cache` directory. Create a `output` directory to retrieves the images.

```shell
docker run --rm \
  --gpus=all \
  -v "$(pwd)/models:/models" \
  -v "$(pwd)/output:/output" \
  -v "$(pwd)/cache:/root/.cache" \
  localhost/library/stable-diffusion:latest \
  --ckpt "/models/v2-1_768-ema-pruned.ckpt" \
  --config "/models/v2-1_768-ema-pruned.yaml" \
  --outdir "/output" \
  --H 768 \
  --W 768 \
  --steps 100 \
  --n_iter 2 \
  --n_samples 2 \
  --device=gpu \
  --prompt "video_game, best_quality, silent_hill, hospital, nurse, chrowbar, dark, blood"
```
