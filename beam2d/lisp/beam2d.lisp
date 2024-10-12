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

;;; class

(defclass sif ()
  (
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
  (loop for i from 1 to 19
	collect (+ (* i 200  ) 0  )
	))



(setq sif_test (make-instance 'sif-family))
;;;

(defun run_solver (fname)
  (progn
    (format t #?"ElmerSolver ${fname}")
    (uiop:run-program (list "ElmerSolver"
                            fname
                            "")
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
  (setf id (i2str (id sif_case)))
  (setf sif_file #?"${*ROOT*}/${id}.sif")
  (setf vtu_file #?"${*ROOT*}/vtu/${id}.vtu")
  (setf export_data #?"${*ROOT*}/vtu/${id}.dat")
  (setf mount_pos1 (concatenate 'string " " id))
  (with-input-from-string (istream *STRING_SIF*)
    
    (with-open-file (ostream (sif-fname sif_case) :direction :output
						  :if-exists :supersede
						  :if-does-not-exist :create)
    (eval `(fill-and-print-template ,istream
			     '(:y0 ,mount_pos1
			       :force "\"-1000*tx\""
			       :export_data ,export_data
			       :sif_file ,sif_file
			       :vtu_file ,vtu_file
			       )
			     :stream ,ostream
			     ))))
  (format t "writing case:~a~%" (sif-fname sif_case))
  )


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

;(run-them)



;; (setq sif_list (mapcar #'(lambda (i) (add_sif i)) (myrange)))
;; (print_sif_fnames sif_list)
;; (setq sif_test (make-instance 'sif-family))
;; (setf (sif-list sif_test) sif_list)
;; (setf (gnuplot_file sif_test) "plot_file.plt")
;; (sif-list sif_test)
;; (gnuplot_file sif_test)





  
