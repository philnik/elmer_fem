(ql:quickload "alexandria")
(ql:quickload "cl-ppcre")
(ql:quickload :cl-interpol)
(ql:quickload :html-template)
(use-package :cl-interpol)
(use-package :html-template)
(enable-interpol-syntax)
(named-readtables:in-readtable :interpol-syntax)


;;; defparameter

(defparameter *INPUT_SIF_FILE* #p"beam2d.sif.tmpl")
(defparameter *OUTPUT-SIF-FILE* "beam2d.sif")
(defparameter *GNUPLOT_FILE* "plot_file.plt")
(defparameter *STRING_SIF* "")
(defparameter *STRING_SIF* (alexandria:read-file-into-string *INPUT_SIF_FILE*))


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
  (loop for i from 1 to 12
	collect (+ (* i 250  ) 100  )
	))



(setq sif_test (make-instance 'sif-family))
;;;

(defun run_solver (fname)
(uiop:run-program (list "ElmerSolver"
                        fname
                        "")
                  :output :string
                  :error-output :string
                  :ignore-error-status t))



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
"
)
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
		      :sif-fname (format nil "sif/~a.sif" i)
		      :fname (format nil "images/d6-1000_~a.dat" i))
  )

(defun write_sif_case2 (sif_case)
  (let* ((a1 (replace_string "_y0_"
			     (format nil "~a" (y0 sif_case))
			     *STRING_SIF*))
	 (a2 (replace_string "_fname_"
			     (fname sif_case)
			     a1)))
    (alexandria:write-string-into-file (sif-fname sif-case)
				       *OUTPUT-SIF-FILE*
				       :if-exists :overwrite))
  )


;; (with-open-file (foo "no-such-file" :direction :output :if-does-not-exist nil)

(defparameter *default-template-output* nil)

(defun write_sif_case (sif_case)
  (setf id (i2str (id sif_case)))
  (setf sif_file (concatenate 'string id ".sif"))
  (setf vtu_file (concatenate 'string id ".vtu"))
  (setf export_data (concatenate 'string id ".dat"))
  (setf mount_pos1 (concatenate 'string " " id))
  (with-input-from-string (istream *STRING_SIF*)
    
    (with-open-file (ostream (sif-fname sif_case) :direction :output
						  :if-exists :supersede
						  :if-does-not-exist :create)
    (eval `(fill-and-print-template ,istream
			     '(:y0 ,mount_pos1
			       :force "400*tx/1+800"
			       :export_data ,export_data
			       :sif_file ,sif_file
			       :vtu_file ,vtu_file
			       )
			     :stream ,ostream
			     ))))
  (format t "writing case:~a~%" (sif-fname sif_case))
  )

(write_sif_case (nth 0 sif_list))


(defun run_sif_list (sif_list)
  (loop for sif_case in sif_list
	do (progn
	     (write_sif_case sif_case)
	     (run_solver (sif-fname sif_case))
	     )
	))



(defun print_sif_fnames (sif_list)
  (mapcar #'(lambda (i) (sif-fname i)) sif_list))

(setq sif_list (mapcar #'(lambda (i) (add_sif i)) (myrange)))



(print_sif_fnames sif_list)

(setq sif_test (make-instance 'sif-family))
(setf (sif-list sif_test) sif_list)
(setf (gnuplot_file sif_test) "plot_file.plt")
(sif-list sif_test)
(gnuplot_file sif_test)

    
(defun export_files (problem)
  (with-open-file (stream (gnuplot_file problem) :direction :output 
						 :if-exists :supersede
						 :if-does-not-exist :create)
    (format stream "~a" (make-gnuplot-string problem))
    )
  )

(export_files sif_test)
    
(run_sif_list sif_list)






  
