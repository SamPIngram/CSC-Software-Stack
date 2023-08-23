import streamlit as st
import pydicom
from pydicom.filebase import DicomFileLike
import io

st.set_page_config(page_title="Transfer Contours", page_icon="✉️")

st.markdown("# Transfer Contours")
st.sidebar.header("Transfer Contours")
# Add set-up for TPS transfer along with config to specify DICOM AET, IP, PORT.
try:
    buffer = io.BytesIO()
    dcm = pydicom.dcmread(st.session_state["output"] + "/segmentations.dcm")
    memory_dataset = DicomFileLike(buffer)
    pydicom.dcmwrite(memory_dataset, dcm)
    st.download_button('Download RT-Struct', buffer, "segmentations.dcm")

    def transfer():
        st.write("Not ready yet...")

    st.button('Transfer to TPS', on_click=transfer)

except:
    st.text('Something is not quite right')