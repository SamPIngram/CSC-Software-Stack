# TODO move to leaner base image

#FROM nvcr.io/nvidia/pytorch:23.07-py3

FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install git ffmpeg libsm6 libxext6 xvfb -y && \
    pip install --upgrade pip && \
    mkdir /totalsegmentator && \
    git clone https://github.com/wasserth/TotalSegmentator.git /totalsegmentator && \
    DEBIAN_FRONTEND=noninteractive pip install /totalsegmentator && \
    # pip uninstall opencv -y && \
    # DEBIAN_FRONTEND=noninteractive apt-get install python3-opencv -y && \
    ldconfig

# modified totalsegmentator/libs.py to use wget rather than requests due to permission issues in docker
COPY libs.py /totalsegmentator/totalsegmentator

RUN apt-get install wget -y

RUN python /totalsegmentator/totalsegmentator/download_pretrained_weights.py

COPY streamlit /streamlit

RUN pip install streamlit pydicom scikit-rt

WORKDIR "/streamlit"
ENTRYPOINT ["streamlit", "run", "TotalSegmentator.py"]
