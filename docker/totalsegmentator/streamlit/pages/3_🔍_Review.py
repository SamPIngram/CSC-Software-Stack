import streamlit as st
from skrt import Image, StructureSet
import matplotlib.pyplot as plt

st.set_page_config(page_title="Review Contours", page_icon="🔍")

st.markdown("# Review Contours")
st.sidebar.header("Review Contours")
# TODO add faster image reviewer
try:
    image = Image(st.session_state["input"] + "/")
    structure_set = StructureSet(st.session_state["output"] + "/segmentations.dcm")
    image.add_structure_set(structure_set)
    dimensions = [image.n_voxels[2], image.n_voxels[0], image.n_voxels[1]]
    axis_views = ['Transverse', 'Coronal', 'Sagittal']
    plot_dir = ['x-y', 'x-z', 'y-z']
    view = st.sidebar.radio('View:', axis_views, index=0)
    view_index = axis_views.index(view)
    slice_ix = st.sidebar.slider('Slice', 0, dimensions[view_index], int(dimensions[view_index]/2)) #z
    contour = st.sidebar.radio('Contour:', structure_set.get_roi_names(), index=0)
    contour_index = structure_set.get_roi_names().index(contour)

    fig, ax = plt.subplots()
    image.plot(plot_dir[view_index], title="", idx=slice_ix, rois=image.structure_sets[0][contour_index], ax=ax)
    ax.axis('off')
    plot = st.pyplot(fig)
except:
    st.text('Something is not quite right')