#!/bin/bash

bash bin/tls-monitor.sh google.com 7 443

exitCode=$?

test ${exitCode} -eq 0
