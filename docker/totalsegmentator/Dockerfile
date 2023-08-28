FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install git ffmpeg libsm6 libxext6 xvfb wget -y && \
    pip install --upgrade pip && \
    mkdir /totalsegmentator && \
    git clone https://github.com/wasserth/TotalSegmentator.git /totalsegmentator && \
    DEBIAN_FRONTEND=noninteractive pip install /totalsegmentator && \
    ldconfig

# modified totalsegmentator/libs.py to use wget rather than requests due to permission issues in docker
COPY libs.py /totalsegmentator/totalsegmentator/libs.py

RUN python /totalsegmentator/totalsegmentator/download_pretrained_weights.py
# modified config.json to not send usage data due to stricter data transfer rules in hospitals
COPY config.json /root/.totalsegmentator/config.json

COPY streamlit /streamlit

RUN pip install streamlit pydicom scikit-rt

WORKDIR "/streamlit"
ENTRYPOINT ["streamlit", "run", "TotalSegmentator.py"]
