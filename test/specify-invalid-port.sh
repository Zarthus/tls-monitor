#!/bin/bash

timeout 5 bash bin/tls-monitor.sh google.com 7 4443

exitCode=$?

rm cert_will_expire.txt

test ${exitCode} -eq 124
