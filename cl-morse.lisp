;; cl-morse.lisp
;;
;; Copyright (c) 2021 Jeremiah LaRocco <jeremiah_larocco@fastmail.com>


;; Permission to use, copy, modify, and/or distribute this software for any
;; purpose with or without fee is hereby granted, provided that the above
;; copyright notice and this permission notice appear in all copies.

;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

(in-package :cl-morse)

(defparameter *american-morse*
  '((#\a . ". --")
    (#\b . "-- . . .")
    (#\c . ". .  .")
    (#\d . "-- . .")
    (#\e . ".")
    (#\f . ". -- .")
    (#\g . "-- -- .")
    (#\h . ". . . .")
    (#\i . ". .")
    (#\j . "-- . -- .")
    (#\k . "-- . --")
    (#\l . "----")
    (#\m . "-- --")
    (#\n . "-- .")
    (#\o . ".  .")
    (#\p . ". . . . .")
    (#\q . ". . -- .")
    (#\r . ".  . .")
    (#\s . ". . .")
    (#\t . "--")
    (#\u . ". . --")
    (#\v . ". . . --")
    (#\w . ". -- --")
    (#\x . ". -- . .")
    (#\y . ". .  . .")
    (#\z . ". . .  .")
    (#\& . ".  . . .")
    (#\1 . ". -- -- .")
    (#\2 . ". . -- . .")
    (#\3 . ". . . -- .")
    (#\4 . ". . . . --")
    (#\5 . "-- -- --")
    (#\6 . ". . . . . .")
    (#\7 . "-- -- . .")
    (#\8 . "-- . . . .")
    (#\9 . "-- . . --")
    (#\0 . "-----")
    (#\, . ". -- . --")
    (#\. . ". . -- -- . .")
    (#\? . "-- . . -- .")
    (#\! . "-- -- -- .")
    (#\; . ". . .   . .")
    (#\: . "-- . --   .   .")
    (#\' . ". . -- .   . -- . .")
    (#\/ . ". . --  --")
    (#\- . ". . . .   . -- . .")
    (#\( . ". . . . .   -- .")
    (#\) . ". . . . .   . .   . .")
    (#\" . ". . -- .  -- .")))

(defparameter *itu-morse-sound*
  '((#\a . ".   ---")
    (#\b . "---   .   .   .")
    (#\c . "---   .   ---   .")
    (#\d . "---   .   .")
    (#\e . ".")
    (#\f . ".   .   ---   .")
    (#\g . "---   ---   .")
    (#\h . ".   .   .   .")
    (#\i . ".   .")
    (#\j . ".   ---   ---   ---")
    (#\k . "---   .   ---")
    (#\l . ".   ---   .   .")
    (#\m . "---   ---")
    (#\n . "---   .")
    (#\o . "---   ---   ---")
    (#\p . ".   ---   ---   .")
    (#\q . "---   ---   .   ---")
    (#\r . ".   ---   .")
    (#\s . ".   .   .")
    (#\t . "---")
    (#\u . ".   .   ---")
    (#\v . ".   .   .   ---")
    (#\w . ".   ---   ---")
    (#\x . "---   .   .   ---")
    (#\y . "---   .   ---   ---")
    (#\z . "---   ---   .   .")
    (#\0 . "---   ---   ---   ---   ---")
    (#\1 . ".   ---   ---   ---   ---")
    (#\2 . ".   .   ---   ---   ---")
    (#\3 . ".   .   .   ---   ---")
    (#\4 . ".   .   .   .   ---")
    (#\5 . ".   .   .   .   .")
    (#\6 . "---   .   .   .   .")
    (#\7 . "---   ---   .   .   .")
    (#\8 . "---   ---   ---   .   .")
    (#\9 . "---   ---   ---   ---   .")
    (#\.   . ".   ---   .   ---   .   ---")
    (#\, . "---   ---   .   .   ---   ---")
    (#\? . ".   .   ---   ---   .   .")
    (#\! . "---   .   ---   .   ---   ---")
    (#\& . ".   ---   .   .   .")
    (#\; . "---   .   ---   .   ---   .")
    (#\: . "---   ---   ---   .   .   .")
    (#\' . ".   ---   ---   ---   ---   .")
    (#\/ . "---   .   .   ---   .")
    (#\- . "---   .   .   .   .   ---")
    (#\( . "---   .   ---   ---   .")
    (#\) . "---   .   ---   ---   .   ---")
    (#\" . ".   ---   .   .   ---   .")
    (#\space . "   ")))

(defparameter *itu-morse*
  '((#\a . ".-")
    (#\b . "-...")
    (#\c . "-.-.")
    (#\d . "-..")
    (#\e . ".")
    (#\f . "..-.")
    (#\g . ".-.")
    (#\h . "....")
    (#\i . "..")
    (#\j . ".-.-")
    (#\k . "-.-")
    (#\l . ".-..")
    (#\m . ".-")
    (#\n . "-.")
    (#\o . ".-.")
    (#\p . ".-..")
    (#\q . ".-.-")
    (#\r . ".-.")
    (#\s . "...")
    (#\t . "-")
    (#\u . "..-")
    (#\v . "...-")
    (#\w . ".-.")
    (#\x . "-..-")
    (#\y . "-.-.")
    (#\z . ".-..")
    (#\0 . ".-.-.")
    (#\1 . ".-.-.")
    (#\2 . "..-.-")
    (#\3 . "...-.")
    (#\4 . "....-")
    (#\5 . ".....")
    (#\6 . "-....")
    (#\7 . ".-...")
    (#\8 . ".-...")
    (#\9 . ".-.-.")
    (#\. . ".-.-.-")
    (#\, . ".-..-.")
    (#\? . "..-...")
    (#\! . "-.-.-.")
    (#\& . ".-...")
    (#\; . "-.-.-.")
    (#\: . ".-....")
    (#\' . ".-.-..")
    (#\/ . "-..-.")
    (#\- . "-....-")
    (#\( . "-.-..")
    (#\) . "-.-..-")
    (#\" . ".-..-.")
    (#\space . "   ")
    (#\space . " ")
    (#\space . "")))

(defun encode-morse (text)
  (apply #'concatenate 'string (loop for char across text
                             collecting (assoc-value *itu-morse* (char-downcase char))
                                     collecting " ")))

;; (defclass state-machine ()
;;   ((states :initform nil)
;;    (transitions :initform nil)))

;; (defclass state ()
;;   ())

;; (defclass transition ()
;;   ())
;; (defclass no-word (state)
;;   ())
;; (defclass in-word (state)
;;   ())
;; (defclass 
;; (defclass morse-code-parser (state-machine)
;;   ((current-morse-char :initform nil))

;; (defgeneric handle-state (machine state current-context)
;; (defun add-state (sm state)
;;   )

;; (defun add-transition (sm input state1 state2)

(defun decode-morse (text)
  (let* ((parts (ju:split text))
         (rval (make-string (length parts) :initial-element #\space) ))
    (loop for idx from 0
          for morse-char in parts do
            (setf (aref rval idx)
                  (car (find morse-char *itu-morse*
                                     :key #'cdr
                                     :test #'string=)))
          finally (return rval))))

(defun to-morse (text &optional (table *itu-morse*))
  (apply #'concatenate
         'string
         (loop for char across text
                             collecting (assoc-value table (char-downcase char))
                             collecting "       ")))
(defun make-morse-streamer (text &key
                                   (dot-duration 0.06d0)
                                   (dot-frequency 540.0d0)
                                   (dash-frequency 540.0d0))
  (declare (optimize (speed 3) (safety 0) (debug 0)))
  (let* ((phase 0.0d0)
         (morse-message (to-morse text *itu-morse-sound*))
         (morse-char-count (length morse-message))
         (morse-duration (* dot-duration morse-char-count))
         (first-time nil))
    (declare (type double-float morse-duration phase
                   dot-duration dot-frequency dash-frequency)
             (type string text)
             (type fixnum morse-char-count))
    (format t "~a~%" (encode-morse text))
    (values
     (lambda (streamer mixer buffer offset length time)
       (when (null first-time)
         (setf first-time time))
       (loop
         with dp double-float = (* 2.0d0 pi 1/44100)

         for index fixnum upfrom offset
         for sample-idx fixnum from 0
         repeat length
         for sample-time fixnum = (+ sample-idx time)
         for sample-char-idx fixnum = (floor (/ sample-time (* 44100 dot-duration)))
         for sample-char = (if (< sample-char-idx morse-char-count)
                               (aref morse-message sample-char-idx)
                               nil)
         for sample fixnum = (cond
                        (;; Dot sound
                         (and sample-char
                              (char= sample-char #\.))
                         (round (* 22000 (sin (* dot-frequency phase)))))
                        ;; Dash sound
                        ((and sample-char
                              (char= sample-char #\-))
                         (round (* 22000 (sin (* dash-frequency phase)))))
                        ;; Silence
                        (t 0.0f))
         do
            (mixalot:stereo-incf (aref buffer index) (mixalot:mono->stereo sample))
           (incf phase dp)
        finally (when (>= sample-char-idx morse-char-count)
                  (mixalot:mixer-remove-streamer mixer streamer))))
     morse-duration)))

(defun generate-morse-code-sound (text &key
                                         (dot-duration 0.05)
                                         (dot-frequency 540.0)
                                         (dash-frequency 540.0))
  (let ((mixer (mixalot:create-mixer)))
    (unwind-protect
         (multiple-value-bind (streamer duration)
             (make-morse-streamer text
                                  :dot-duration dot-duration
                                  :dot-frequency dot-frequency
                                  :dash-frequency dash-frequency)
          (mixalot:mixer-add-streamer mixer streamer)
          (sleep duration))
      (mixalot:destroy-mixer mixer))))
