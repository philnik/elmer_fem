


(defparameter fname
  "c:/Users/filip/AppData/Roaming/fem/elmer_fem/beam2d/lisp/beam2d.lisp")

(load fname)
;(ql:quickload "beam2d")
;(sb-ext:save-lisp-and-die #p"my-app-binary" :toplevel #'beam2d:run-them :executable t)
(sb-ext:save-lisp-and-die #p"beam2d.exe" :toplevel #'run-them :executable t)
