
;;; class

(defclass %sif_header ()
  ((mesh_db :accessor  mesh_db
       :reader mesh_db
       :initarg :mesh_db
       :initform ""
       :type string
       :documentation "mesh db")
   (results_directory :accessor  results_directory
       :reader results_directory
       :initarg :results_directory
       :initform ""
       :type string
       :documentation "results directory")
   (text :accessor  text
       :reader text
       :initarg :text
       :initform ""
       :type string
       :documentation "text")
   ))


(defclass %sif_simulation ()
  ((solver_input :accessor  solver_input
		 :reader solver_input
		 :initarg :solver_input
		 :initform ""
		 :type string
		 :documentation "solver_input")
   (post_file :accessor  post_file
       :reader post_file
       :initarg :post_file
       :initform ""
       :type string
		      :documentation "post_file")
   (text :accessor  text
       :reader text
       :initarg :text
       :initform ""
       :type string
       :documentation "text")
   ))




(defclass sif ()
  (
  (header :accessor  header
       :reader header
       :initarg :header
       :initform ""
       :type string
       :documentation "header")
   
   (y0 :accessor  y0
       :reader sif-y0
       :initarg :y0
       :initform 1000
       :type real
       :documentation "y0")
  (id :accessor  id
       :reader id
       :initarg :id
       :initform 0
       :type integer
       :documentation "identification number")
   
  (sif-fname :accessor  sif-fname
	    :reader sif-fname
	    :initarg :sif-fname
	    :initform "beam2d.sif"
	    :type string
	     :documentation "sif file name")

   (boundary_targets :accessor  boundary_targets
		     :reader boundary_targets
		     :initarg :boundary_targets
		     :initform "targets"
		     :type string
		     :documentation "boundary_targets")

   
   (fname :accessor  fname
	  :reader fname
          :initarg :fname
	  :initform "1000.dat"
          :type string 
	  :documentation "fname")
   ))



(defclass sif-family ()
  (
   (sif-list :accessor  sif-list
	 :reader sif-list
	 :initarg :sif-list
	 :initform '()
	 :type list
       :documentation "case_sif")
   (gnuplot_file :accessor  gnuplot_file
		 :reader gnuplot_file
		 :initarg :fname
		 :initform "1000.plt"
		 :type string 
		 :documentation "gnuplot file")
   (png_file :accessor  png_file
	      :reader png_file
              :initarg :fname
	      :initform "image.png"
              :type string 
	      :documentation "image file to export diagrams")
   
   ))
