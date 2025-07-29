(defparameter *INPUT_SIF_FILE* #?"${*ROOT*}/beam2d.sif.tmpl")
(defparameter *OUTPUT-SIF-FILE* #?"${*ROOT*}/beam2d.sif")
(defparameter *GNUPLOT_FILE* #?"${*ROOT*}/plot_file.plt")

(defparameter *STRING_SIF* "")
(defparameter *STRING_SIF* (alexandria:read-file-into-string *INPUT_SIF_FILE*))
(defparameter *default-template-output* nil)

(defparameter  *Mesh_DB* "c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d/beam2d")
(defparameter *Results_Directory* "c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d/vtu/")
