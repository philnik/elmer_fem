

(ql:quickload "alexandria")

(ql:quickload "cl-ppcre")

(defparameter input_sif_file "beam2d.sif.tmpl")
(defparameter output_sif_file "beam2d.sif")


(defparameter string_sif (alexandria:read-file-into-string input_sif_file))

(defun replace_string (from to mystr)
  (cl-ppcre:regex-replace-all from
			      mystr
			      to
			      :preserve-case t))


  
(loop for i in '(1000 2000 3000)
      do (format t "~a" i))


(let* ((a1 (replace_string "_y0_" "1000" string_sif))
       (a2 (replace_string "_fname_" "1000.dat" a1)))
  (alexandria:write-string-into-file a2
				     output_sif_file
				     :if-exists :overwrite))
  
