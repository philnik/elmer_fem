<<<<<<< HEAD
(ql:quickload "alexandria")
(ql:quickload "cl-ppcre")
(ql:quickload :cl-interpol)
(ql:quickload :html-template)
(use-package :cl-interpol)
(use-package :html-template)
(enable-interpol-syntax)
(named-readtables:in-readtable :interpol-syntax)
(defparameter *string-modifier* #'identity)

;;; defparameter

(defparameter *ROOT* "c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d/")

(defparameter *INPUT_SIF_FILE* #?"${*ROOT*}/beam2d.sif.tmpl")
(defparameter *OUTPUT-SIF-FILE* #?"${*ROOT*}/beam2d.sif")
(defparameter *GNUPLOT_FILE* #?"${*ROOT*}/plot_file.plt")

(defparameter *STRING_SIF* "")
(defparameter *STRING_SIF* (alexandria:read-file-into-string *INPUT_SIF_FILE*))
(defparameter *default-template-output* nil)

(defparameter  *Mesh_DB* "c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d/beam2d")
(defparameter *Results_Directory* "c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d/vtu/")

(defun header_string (mesh_db results_directory)
#?"
Header
  CHECK KEYWORDS Warn
  Mesh DB \"${mesh_db}\"
  Include Path \"\"
  Results Directory \"${results_directory}\"
End
")

(format t 
(header_string *Mesh_DB* *Results_Directory*)
)

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


(defun make_sif_header()
  (let (( sif_header (make-instance '%sif_header
				:mesh_db *Mesh_DB*
				:Results_Directory *Results_Directory*
				    )))
    (progn
      (setf (text sif_header) (header_string (mesh_db sif_header) (results_directory sif_header)))
      (text sif_header)
      sif_header
    )))

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

(defun i2str (i)
  (format nil "~a" i)
  )

(defun myrange ()
  (loop for i from 1 to 9
	collect (+ (* i 100  ) 0  )
	))



(setq sif_test (make-instance 'sif-family))
;;;

(defun run_solver (fname)
  (progn
    (format t #?"ElmerSolver ${fname}")
    (uiop:run-program (list "ElmerSolver" fname "")
                      :output :string
                      :error-output :string
                      :ignore-error-status nil)))


(defun make-gnuplot-string (sif-problems)
  (let ((sif_list (sif-list sif-problems))
	(png_file (png_file sif-problems)))
    (with-output-to-string (stream)
      (format stream
#?"
set terminal png
unset key
set output \"${png_file}
set term png size 1000,1000
set grid
plot \\
")
(loop for i in sif_list
	do (let ((kk (fname i)))
	     (format stream "\"~a\" using 4:8 with lines,\\~%" kk)
	     ))
  )))

  
(defun replace_string (from to mystr)
  (cl-ppcre:regex-replace-all from
			      mystr
			      to
			      :preserve-case t))

(defun print_sif_list (sif_list)
  (mapcar #'(lambda (i) (format t "~a ----- ~a ~%" (y0 i) (fname i))) sif_list)
  )


(defun add_sif (i)
  (make-instance 'sif :y0 i
		      :id i
		      :sif-fname #?"${*ROOT*}/sif/${i}.sif"
		      :fname #?"${*ROOT*}/vtu/${i}.dat"
		      ))


(defun write_sif_case (sif_case)
  (let ((id (i2str (id sif_case))))
    (let ((sif_file #?"${*ROOT*}/${id}.sif")
	  (vtu_file #?"${*ROOT*}/vtu/${id}.vtu")
	  (export_data #?"${*ROOT*}/vtu/${id}.dat")
	  (mount_pos1 (concatenate 'string " " id))
	  (string-sif (alexandria:read-file-into-string *INPUT_SIF_FILE*))
	  (text_sif_header (text (make_sif_header)))
	  )
      
      (with-input-from-string (istream string-sif)
	(with-open-file (ostream (sif-fname sif_case) :direction :output
						      :if-exists :supersede
						      :if-does-not-exist :create)
	  (eval `(fill-and-print-template ,istream
					  '(:y0 ,mount_pos1
					    :force "\"-1000*tx\""
					    :export_data ,export_data
					    :sif_file ,sif_file
					    :vtu_file ,vtu_file
					    :text_sif_header ,text_sif_header
					    )
					  :stream ,ostream
					  ))))))
  (format t "writing case:~a~%" (sif-fname sif_case))
  )


;;;!Real MATC <!-- TMPL_VAR force -->




(defun run_sif_list (sif_list)
  (loop for sif_case in sif_list
	do (progn
	     (write_sif_case sif_case)
	     (run_solver (sif-fname sif_case))
	     )
	))

(defun print_sif_fnames (sif_list)
  (mapcar #'(lambda (i) (sif-fname i)) sif_list))


    
(defun export_files (problem)
  (with-open-file (stream (gnuplot_file problem) :direction :output 
						 :if-exists :supersede
						 :if-does-not-exist :create)
    (format stream "~a" (make-gnuplot-string problem))
    )
  )

(defun run-them ()
  (progn
    (setq sif_list (mapcar #'(lambda (i) (add_sif i)) (myrange)))
    (print_sif_fnames sif_list)
    (setq sif_test (make-instance 'sif-family))
    (setf (sif-list sif_test) sif_list)
    (setf (gnuplot_file sif_test) *GNUPLOT_FILE*)
    (sif-list sif_test)
    (gnuplot_file sif_test)
    (export_files sif_test)
    (run_sif_list sif_list)
    )
  )

(run-them)



;; (setq sif_list (mapcar #'(lambda (i) (add_sif i)) (myrange)))
;; (print_sif_fnames sif_list)
;; (setq sif_test (make-instance 'sif-family))
;; (setf (sif-list sif_test) sif_list)
;; (setf (gnuplot_file sif_test) "plot_file.plt")
;; (sif-list sif_test)
;; (gnuplot_file sif_test)





  
=======
(ql:quickload "alexandria")
(ql:quickload "cl-ppcre")
(ql:quickload "uiop")

(ql:quickload :cl-interpol)
(ql:quickload :html-template)
(use-package :cl-interpol)
(use-package :html-template)
(enable-interpol-syntax)
(named-readtables:in-readtable :interpol-syntax)
(defparameter *string-modifier* #'identity)

;;; defparameter
(defparameter *ROOT* "c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d/")

(load #?"${*ROOT*}/lisp/sifparameters.lisp")
(load #?"${*ROOT*}/lisp/sifclasses.lisp")


(defun header_string (mesh_db results_directory)
#?"
Header
  CHECK KEYWORDS Warn
  Mesh DB \"${mesh_db}\"
  Include Path \"\"
  Results Directory \"${results_directory}\"
End
")

(defun simulation_string (solver_input post_file)
  #?"
Simulation
  Max Output Level = 5
  Coordinate System = Cartesian
  Coordinate Mapping(3) = 1 2 3
  Simulation Type = Steady state
  Steady State Max Iterations = 1
  Output Intervals(1) = 1
  Solver Input File =  \"${solver_input}\"
  Post File = \"${post_file}\"
End
")

(defun print_2d_coordinates (l)
  "
(list '(1 2) '(3 4))) ->
1 2
3 4 
"
  (with-output-to-string (stream)
    (mapcar #'(lambda (i) (format stream "~{~a ~}~%" i)) l)
  stream))

(defun split-points (min max split)
  "
(split-points 0 4000.0 5)=> (0 800.0 1600.0 2400.0 3200.0 4000.0)
"
  (let ((step (/ (- max min) split))
	(l '()))

    (dotimes (i split)
      (push (* (- split i)  step)
	    l))
    (push min l)

    l))

(defun boundary_string% (m_points)
  (let* ((points (print_2d_coordinates m_points))
	 (no (+ 0 (length m_points))))
  #?"
Boundary Condition 3
  Target Coordinates(${no},2) = ${points}
  Name = \"r1\"

  Displacement 3 = 0
  Displacement 2 = 0 
  Displacement 1 = 0
End"
  ))

(defun boundary_string (min max split)
  (let* ((bp (split-points min max split))
	 (ssp (loop for i in bp collect (list i 0)))
	 )
	(boundary_string% ssp)))


(defun random_split (min max split)
  (let ((dev 4000))
  (list min
        (+ 0000 (random dev))
        (+ 0000 (random dev))
        (+ 0000 (random dev))
        max)))
           
        

(defun boundary_string2 (min max split)
  (let* ((bp (random_split min max 4 ))
	     (ssp (loop for i in bp collect (list i 0))))
    (push (list (/ max split 0.5) 0.0) ssp)
	(boundary_string% ssp)))


(defun boundary_string3 (min max split)
  (let* ((bp (split-points min max 4 ))
	     (ssp (loop for i in bp collect (list i 0))))
    (push (list (/ max split 0.5) 0.0) ssp)
	(boundary_string% ssp)))





;(test_boundary_string2 0 4000.0 20 )


(defun make_sif_header()
  (let (( sif_header (make-instance '%sif_header
				:mesh_db *Mesh_DB*
				:Results_Directory *Results_Directory*
				    )))
    (progn
      (setf (text sif_header) (header_string (mesh_db sif_header) (results_directory sif_header)))
      (text sif_header)
      sif_header
    )))

(defun make_sif_simulation(solver_input post_file)
  (let (( sif_simulation (make-instance '%sif_simulation
				:solver_input solver_input
				:post_file post_file
				    )))
    (progn
      (setf (text sif_simulation) (simulation_string solver_input post_file))
      sif_simulation
    )))

(text (make_sif_simulation 1 2))

(defun i2str (i)
  (format nil "~a" i)
  )

(defun myrange ()
  (loop for i from 1 to 19
	collect (+ (* i 200  ) 0  )
	))

(defun myr2 () (loop for i from 1   to 3000 collect i))


(setq sif_test (make-instance 'sif-family))
;;;

(defun run_solver (fname)
  (progn
    (format t #?"ElmerSolver ${fname}")
    (uiop:run-program (list "ElmerSolver" fname "")
                      :output :string
                      :error-output :string
                      :ignore-error-status nil)))


(defun make-gnuplot-string (sif-problems)
  (let ((sif_list (sif-list sif-problems))
	(png_file (png_file sif-problems)))
    (with-output-to-string (stream)
      (format stream
#?"
set terminal png
unset key
set output \"${png_file}
set term png size 1000,1000
set grid
plot \\
")
(loop for i in sif_list
	do (let ((kk (fname i)))
	     (format stream "\"~a\" using 4:8 with lines,\\~%" kk)
	     ))
  )))


(defun replace_string (from to mystr)
  (cl-ppcre:regex-replace-all from
			      mystr
			      to
			      :preserve-case t))

(defun print_sif_list (sif_list)
  (mapcar #'(lambda (i) (format t "~a ----- ~a ~%" (y0 i) (fname i))) sif_list)
  )


(defun add_sif (i)
  (make-instance 'sif :y0 i
		      :id i
		      :sif-fname #?"${*ROOT*}/sif/${i}.sif"
		      :fname #?"${*ROOT*}/vtu/${i}.dat"
		      ))


(defun write_sif_case (sif_case)
  (let ((id (i2str (id sif_case))))
    (let* ((sif_file #?"${*ROOT*}/${id}.sif")
           (vtu_file #?"${*ROOT*}/vtu/${id}.vtu")
	       (export_data #?"${*ROOT*}/vtu/${id}.dat")
	       (mount_pos1 (concatenate 'string " " id))
	       (string-sif (alexandria:read-file-into-string *INPUT_SIF_FILE*))
	       (text_sif_header (text (make_sif_header)))
	       (text_sif_simulation (text (make_sif_simulation sif_file vtu_file)))
           (text_sif_boundary (boundary_string2 0 4000.0 (id sif_case)))
	  )
      
      (with-input-from-string (istream string-sif)
	(with-open-file (ostream (sif-fname sif_case) :direction :output
						      :if-exists :supersede
						      :if-does-not-exist :create)
	  (eval `(fill-and-print-template ,istream
					  '(:y0 ,mount_pos1
					    :force "\"-1000*tx\""
					    :export_data ,export_data
					    :sif_file ,sif_file
					    :vtu_file ,vtu_file
					    :text_sif_header ,text_sif_header
					    :text_sif_simulation ,text_sif_simulation
                        :text_sif_boundary ,text_sif_boundary
					    )
					  :stream ,ostream
					  ))))))
  (format t "writing case:~a~%" (sif-fname sif_case))
  )

;;;!Real MATC <!-- TMPL_VAR force -->

(defun run_sif_list (sif_list)
  (loop for sif_case in sif_list
	do (progn
	     (write_sif_case sif_case)
	     (run_solver (sif-fname sif_case))
	     )
	))

(defun print_sif_fnames (sif_list)
  (mapcar #'(lambda (i) (sif-fname i)) sif_list))


    
(defun export_files (problem)
  (with-open-file (stream (gnuplot_file problem) :direction :output 
						 :if-exists :supersede
						 :if-does-not-exist :create)
    (format stream "~a" (make-gnuplot-string problem))
    )
  )

(defun run-them ()
  (progn
    (setq sif_list (mapcar #'(lambda (i) (add_sif i)) (myr2)))
    (print_sif_fnames sif_list)
    (setq sif_test (make-instance 'sif-family))
    (setf (sif-list sif_test) sif_list)
    (setf (gnuplot_file sif_test) *GNUPLOT_FILE*)
    (sif-list sif_test)
    (gnuplot_file sif_test)
    (export_files sif_test)
    (run_sif_list sif_list)
    )
  )

;(run-them)
>>>>>>> portable_test
