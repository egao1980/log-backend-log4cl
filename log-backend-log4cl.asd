(defsystem "log-backend-log4cl"
  :version "0.1.1"
  :description "log4cl backend for log-protocol"
  :author "egao1980"
  :license "MIT"
  :depends-on ("log-protocol" "log4cl")
  :serial t
  :pathname "src"
  :components ((:file "package")
               (:file "backend"))
  :in-order-to ((test-op (test-op "log-backend-log4cl/tests"))))

(defsystem "log-backend-log4cl/tests"
  :depends-on ("log-backend-log4cl" "rove")
  :pathname "tests"
  :serial t
  :components ((:file "package")
               (:file "backend-test"))
  :perform (test-op (o c)
             (unless (symbol-call :rove :run c)
               (error "tests failed for ~A" (component-name c)))))
