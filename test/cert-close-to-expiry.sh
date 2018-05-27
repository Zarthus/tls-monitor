#!/bin/bash

bash bin/tls-monitor.sh mozilla-modern.badssl.com 1000

exitCode=$?

test ${exitCode} -eq 1
