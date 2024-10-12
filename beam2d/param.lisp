(ql:quickload "alexandria")
(ql:quickload "cl-ppcre")


;;; defparameter

(defparameter input_sif_file "beam2d.sif.tmpl")
(defparameter output_sif_file "beam2d.sif")
(defparameter plot_line "plot_line.plt")
(defparameter string_sif (alexandria:read-file-into-string input_sif_file))

;;; class

(defclass sif ()
  (
   (y0 :accessor  y0
       :reader sif-y0
       :initarg :y0
       :initform 1000
       :type real
       :documentation "y0")
   (fname :accessor  fname
	  :reader sif-fname
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
		 :reader sif-fname
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

(setq sif_test (make-instance 'sif-family))
;;;

(defun solve_problem ()
(uiop:run-program (list "ElmerSolver"
                        "beam2d.sif"
                        "")
                  :output :string
                  :error-output :string
                  :ignore-error-status t))

(defun make-gnuplot-string (sif-problems)
  (let ((sif_list (sif-list sif-problems))
	(png_file (png_file sif-problems)))
(with-output-to-string (stream)
  (format stream "set terminal png~%")
  (format stream "unset key ~%")
  (format stream (concatenate 'string "set output \"" png_file  "\" ~%"))
  (format stream "set term png size 1000,1000 ~%")
  (format stream "set grid ~%")
  (format stream "plot \\~%")
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
  (make-instance 'sif :y0 i  :fname (format nil "images/d6-1000_~a.dat" i))
  )

(defun write_sif_case (sif_case)
  (let* ((a1 (replace_string "_y0_"
			     (format nil "~a" (y0 sif_case))
			     string_sif))
	 (a2 (replace_string "_fname_"
			     (fname sif_case)
			     a1)))
    (alexandria:write-string-into-file a2
				       output_sif_file
				       :if-exists :overwrite))
  )

(defun run_sif_list (sif_list)
  (loop for sif_case in sif_list
	do (progn
	     (write_sif_case sif_case)
	     (solve_problem)
	     )
	))


(defun myrange ()
  (loop for i from 1 to 10 
	collect (+ (* i 400  ) 0 )
	))


(setq sif_list (mapcar #'(lambda (i) (add_sif i)) (myrange)))

(setq sif_test (make-instance 'sif-family))
(setf (sif-list sif_test) sif_list)
(setf (gnuplot_file sif_test) "plot_line.plt")
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






  
