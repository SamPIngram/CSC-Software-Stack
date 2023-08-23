FROM nvcr.io/nvidia/pytorch:23.07-py3

RUN apt-get update && \
    apt-get install git ffmpeg libsm6 libxext6 -y && \
    apt-get install xvfb -y && \
    pip install --upgrade pip && \
    mkdir /totalsegmentator && \
    git clone https://github.com/wasserth/TotalSegmentator.git /totalsegmentator && \
    pip install /totalsegmentator && \
    pip uninstall opencv -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install python3-opencv -y && \
    pip install scikit-rt && \
    ldconfig

# modified totalsegmentator/libs.py to use wget rather than requests due to permission issues in docker
COPY libs.py /totalsegmentator/totalsegmentator

RUN python /totalsegmentator/totalsegmentator/download_pretrained_weights.py

COPY streamlit /streamlit

RUN pip install streamlit pydicom