#!/bin/bash

bash bin/tls-monitor.sh mozilla-modern.badssl.com 370

exitCode=$?

test ${exitCode} -eq 1
