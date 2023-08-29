import streamlit as st
import time
import pydicom
import zipfile
import os
from datetime import datetime
import glob

st.set_page_config(page_title="Upload TotalSegmentator", page_icon="⏫")

st.markdown("# Upload Zipped Image DICOM")
st.sidebar.header("Upload Image DICOM")

def clean_files(path):
    files = glob.glob(path)
    true_ct_files = 0
    removed_files_not_dicom = 0
    removed_files_not_CT = 0
    for f in files:
        try:
            ds = pydicom.dcmread(f)
            if ds.Modality!='CT':
                os.remove(f)
                removed_files_not_CT += 1
            else:
                ct_files += 1
        except InvalidDicomError:
            os.remove(f)
            removed_files_not_dicom += 1
    return true_ct_files, removed_files_not_CT, removed_files_not_dicom
        

def parse_files():
    if zip_ct is not None:
        with zipfile.ZipFile(zip_ct, "r") as z:
            st.session_state["session"] = "tmp/" + str(datetime.now().strftime("%Y%m%d%H%M%S%f"))
            st.session_state["input"] = st.session_state["session"] + "/input"
            st.session_state["output"] = st.session_state["session"] + "/ouput"
            # TODO add proper logging (https://stackoverflow.com/questions/75410059/how-to-log-user-activity-in-a-streamlit-app)
            print(st.session_state["session"], file=open('tmp/log.txt', 'a'))
            os.makedirs(st.session_state["input"])
            os.makedirs(st.session_state["output"])
            z.extractall(st.session_state["input"])
            true_ct_files, removed_files_not_CT, removed_files_not_dicom = clean_files(st.session_state["input"])
            st.sidebar.write(
                f"Successful checked files:\nfound {true_ct_files} CT files\nremoved {removed_files_not_CT} non-CT files \nremoved {removed_files_not_dicom} non-DICOM files"
            )
    else:
        st.sidebar.write("Need to upload files first!")


zip_ct = st.file_uploader(
    "Zipped CT Dataset", type=["zip"], accept_multiple_files=False
)

st.button("Check Upload", on_click=parse_files)
