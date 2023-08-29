FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install git ffmpeg libsm6 libxext6 xvfb wget -y && \
    pip install --upgrade pip && \
    mkdir /totalsegmentator && \
    git clone https://github.com/SamPIngram/CSC-TotalSegmentator.git /totalsegmentator && \
    DEBIAN_FRONTEND=noninteractive pip install /totalsegmentator && \
    ldconfig

RUN python /totalsegmentator/totalsegmentator/download_pretrained_weights.py

RUN python /totalsegmentator/totalsegmentator/dicom_io.py

COPY streamlit /streamlit

RUN pip install streamlit pydicom scikit-rt

WORKDIR "/streamlit"
ENTRYPOINT ["streamlit", "run", "TotalSegmentator.py", "--server.maxUploadSize", "500"]
