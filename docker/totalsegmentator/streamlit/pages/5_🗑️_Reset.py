import streamlit as st

st.set_page_config(page_title="Reset", page_icon="🗑️")

st.markdown("# Reset")
st.sidebar.header("Reset")
# TODO Show session information before resetting. 
# TODO Expand in future as a session manager.
def reset():
    for key in st.session_state.keys():
        del st.session_state[key]
    st.sidebar.write("Cleared session")

st.button('Reset', on_click=reset)