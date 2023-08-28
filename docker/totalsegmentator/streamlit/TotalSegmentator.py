import streamlit as st

st.set_page_config(
    page_title="TotalSegmentator",
    page_icon="✏️",
)

st.write("# Welcome to CSC TotalSegmentator! 👋")

st.sidebar.success("Select a option above.")

st.markdown(
    """
    [TotalSegmentator](https://github.com/wasserth/TotalSegmentator) is an open-source tool for auto-segmentation of 104 structures in CT images.
    This has been implemented within [CSC-Software-Stack](https://github.com/SamPIngram/CSC-Software-Stack) with additional UI for testing
"""
)