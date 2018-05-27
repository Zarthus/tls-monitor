SHELL := bash

.tc-expired:
	bash ./test/cert-expired.sh

.tc-close-to-expiry:
	bash ./test/cert-close-to-expiry.sh

.tc-correct:
	bash ./test/cert-ok.sh

.tc-specify-port:
	bash ./test/specify-port.sh

.tc-specify-invalid-port:
	bash ./test/specify-invalid-port.sh

test: .tc-expired .tc-close-to-expiry .tc-correct .tc-specify-port .tc-specify-invalid-port
	# Testsuite complete.
