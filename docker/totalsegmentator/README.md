# TotalSegmentator

Tool for segmentation of 104 classes in CT images. It was trained on a wide range of different CT images (different scanners, institutions, protocols,...) and therefore should work well on most images. The training dataset with 1204 subjects can be downloaded from [Zenodo](https://doi.org/10.5281/zenodo.6802613). You can also try the tool online at [totalsegmentator.com](https://totalsegmentator.com/).

![Alt text](https://github.com/wasserth/TotalSegmentator/blob/87560f329b3bd97543f975ebd47ba269933f43ee/resources/imgs/overview_classes.png?raw=true)

Created by the department of [Research and Analysis at University Hospital Basel](https://www.unispital-basel.ch/en/radiologie-nuklearmedizin/forschung).  
If you use it please cite our [Radiology AI paper](https://pubs.rsna.org/doi/10.1148/ryai.230024). Please also cite [nnUNet](https://github.com/MIC-DKFZ/nnUNet) since TotalSegmentator is heavily based on it.

### CSC TotalSegmentator Version

Builds on the base code to add a [Streamlit](https://streamlit.io/) UI for features which would be clinically useful.

### Class details

The following table shows a list of all classes.

TA2 is a standardised way to name anatomy. Mostly the TotalSegmentator names follow this standard. 
For some classes they differ which you can see in the table below.

[Here](resources/totalsegmentator_snomed_mapping.csv) you can find a mapping of the TotalSegmentator classes to SNOMED-CT codes.

|Index|TotalSegmentator name|TA2 name|
|:-----|:-----|:-----|
1 | spleen ||
2 | kidney_right ||
3 | kidney_left ||
4 | gallbladder ||
5 | liver ||
6 | stomach ||
7 | aorta ||
8 | inferior_vena_cava ||
9 | portal_vein_and_splenic_vein | hepatic portal vein |
10 | pancreas ||
11 | adrenal_gland_right | suprarenal gland |
12 | adrenal_gland_left | suprarenal gland |
13 | lung_upper_lobe_left | superior lobe of left lung |
14 | lung_lower_lobe_left | inferior lobe of left lung |
15 | lung_upper_lobe_right | superior lobe of right lung |
16 | lung_middle_lobe_right | middle lobe of right lung |
17 | lung_lower_lobe_right | inferior lobe of right lung |
18 | vertebrae_L5 ||
19 | vertebrae_L4 ||
20 | vertebrae_L3 ||
21 | vertebrae_L2 ||
22 | vertebrae_L1 ||
23 | vertebrae_T12 ||
24 | vertebrae_T11 ||
25 | vertebrae_T10 ||
26 | vertebrae_T9 ||
27 | vertebrae_T8 ||
28 | vertebrae_T7 ||
29 | vertebrae_T6 ||
30 | vertebrae_T5 ||
31 | vertebrae_T4 ||
32 | vertebrae_T3 ||
33 | vertebrae_T2 ||
34 | vertebrae_T1 ||
35 | vertebrae_C7 ||
36 | vertebrae_C6 ||
37 | vertebrae_C5 ||
38 | vertebrae_C4 ||
39 | vertebrae_C3 ||
40 | vertebrae_C2 ||
41 | vertebrae_C1 ||
42 | esophagus ||
43 | trachea ||
44 | heart_myocardium ||
45 | heart_atrium_left ||
46 | heart_ventricle_left ||
47 | heart_atrium_right ||
48 | heart_ventricle_right ||
49 | pulmonary_artery | pulmonary arteries |
50 | brain ||
51 | iliac_artery_left | common iliac artery |
52 | iliac_artery_right | common iliac artery |
53 | iliac_vena_left | common iliac vein |
54 | iliac_vena_right | common iliac vein |
55 | small_bowel | small intestine |
56 | duodenum ||
57 | colon ||
58 | rib_left_1 ||
59 | rib_left_2 ||
60 | rib_left_3 ||
61 | rib_left_4 ||
62 | rib_left_5 ||
63 | rib_left_6 ||
64 | rib_left_7 ||
65 | rib_left_8 ||
66 | rib_left_9 ||
67 | rib_left_10 ||
68 | rib_left_11 ||
69 | rib_left_12 ||
70 | rib_right_1 ||
71 | rib_right_2 ||
72 | rib_right_3 ||
73 | rib_right_4 ||
74 | rib_right_5 ||
75 | rib_right_6 ||
76 | rib_right_7 ||
77 | rib_right_8 ||
78 | rib_right_9 ||
79 | rib_right_10 ||
80 | rib_right_11 ||
81 | rib_right_12 ||
82 | humerus left ||
83 | humerus right ||
84 | scapula_left ||
85 | scapula_right ||
86 | clavicula_left | clavicle |
87 | clavicula_right | clavicle |
88 | femur left ||
89 | femur right ||
90 | hip_left | hip bone |
91 | hip_right | hip bone |
92 | sacrum ||
93 | face ||
94 | gluteus_maximus_left | gluteus maximus muscle |
95 | gluteus_maximus_right | gluteus maximus muscle |
96 | gluteus_medius_left | gluteus medius muscle |
97 | gluteus_medius_right | gluteus medius muscle |
98 | gluteus_minimus_left | gluteus minimus muscle |
99 | gluteus_minimus_right | gluteus minimus muscle |
100 | autochthon_left ||
101 | autochthon_right ||
102 | iliopsoas_left | iliopsoas muscle |
103 | iliopsoas_right | iliopsoas muscle |
104 | urinary_bladder ||