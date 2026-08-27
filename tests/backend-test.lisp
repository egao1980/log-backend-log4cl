(in-package #:log-backend-log4cl/tests)

(deftest use-log4cl-backend-binds
  (let ((log-protocol:*log-backend* nil))
    (log-backend-log4cl:use-log4cl-backend)
    (ok (typep log-protocol:*log-backend* 'log-backend-log4cl:log4cl-backend))))

(deftest log4cl-backend-writes-text
  (let ((log-protocol:*log-backend* nil)
        (log-protocol:*log-context* nil)
        (log-protocol:*log-layout* :text)
        (log-protocol:*log-level* :info)
        (log-protocol:*log-filters* nil)
        (log-protocol:*log-async* nil)
        (line nil))
    (unwind-protect
         (setf line
               (with-output-to-string (out)
                 (log-backend-log4cl:use-log4cl-backend :stream out)
                 (log-protocol:configure :level :info :layout :text)
                 (log-protocol:info "hello log4cl")))
      (ignore-errors (log-protocol:shutdown-async)))
    (ok (search "INFO" line))
    (ok (search "hello log4cl" line))))
