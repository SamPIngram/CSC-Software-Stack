import streamlit as st
import time
import pydicom
import zipfile
import os
from datetime import datetime

st.set_page_config(page_title="Upload TotalSegmentator", page_icon="⏫")

st.markdown("# Upload Zipped Image DICOM")
st.sidebar.header("Upload Image DICOM")


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
            ct_files = z.namelist()
            clean_ct_files = []
            dirty_ct_files = []
            if ct_files is not None:
                for ct_file in ct_files:
                    try:
                        dcm = pydicom.dcmread(z.open(ct_file))
                        # TODO add CT type check
                        clean_ct_files.append(z.open(ct_file))
                    except InvalidDicomError:
                        dirty_ct_files.append(z.open(ct_file))
                st.sidebar.write(
                    f"Successful uploaded file: {len(clean_ct_files)}/{len(ct_files)}"
                )
                st.sidebar.write(
                    f"Unsuccessful uploaded file: {len(dirty_ct_files)}/{len(ct_files)}"
                )

                st.session_state["CT"] = clean_ct_files
    else:
        st.sidebar.write("Need to upload files first!")


zip_ct = st.file_uploader(
    "Zipped CT Dataset", type=["zip"], accept_multiple_files=False
)

st.button("Check Upload", on_click=parse_files)
