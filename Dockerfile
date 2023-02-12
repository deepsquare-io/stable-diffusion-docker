#----------------------------------------------------------------------
FROM registry-1.docker.io/nvidia/cuda:11.7.1-cudnn8-runtime-ubuntu22.04
#----------------------------------------------------------------------

COPY requirements.txt /

RUN apt update -y \
  && apt install -y \
  python3 \
  python3-pip \
  python-is-python3 \
  git \
  make \
  libgd3 \
  libgdk-pixbuf-2.0-0 \
  libgl1-mesa-glx \
  libglib2.0-0 \
  libsixel-bin \
  curl \
  imagemagick \
  file \
  && apt full-upgrade -y \
  && rm -rf /var/lib/apt/lists/*

RUN pip3 install -r requirements.txt \
  --extra-index-url https://download.pytorch.org/whl/cu117

RUN cd / \
  && git clone https://github.com/Stability-AI/stablediffusion.git \
  && cd stablediffusion \
  && pip install -r requirements.txt

WORKDIR /stablediffusion

ENTRYPOINT [ "python", "scripts/txt2img.py" ]
