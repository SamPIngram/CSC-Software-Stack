import streamlit as st
import os
from totalsegmentator.python_api import totalsegmentator
import datetime

st.set_page_config(page_title="Run TotalSegmentator", page_icon="🪄")

st.markdown("# Run TotalSegmentator")
st.sidebar.header("Run TotalSegmentator")

button_disable = False

# TODO add reporting of the progress
# TODO get button disable working when data has already been contoured
def run_totalsegmentator():
    if "CT" not in st.session_state:
        st.sidebar.write("Need to upload CT first!")
    else:
        with st.spinner("Running..."):
            totalsegmentator(
                st.session_state["input"],
                st.session_state["output"],
                output_type="dicom",
            )
            st.sidebar.write("Finished autocontouring. Please 🔍 Review.")
            button_disable = True

st.button("Run", on_click=run_totalsegmentator, disabled=button_disable)
