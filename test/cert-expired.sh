#!/bin/bash

bash bin/tls-monitor.sh expired.badssl.com 7

exitCode=$?

test ${exitCode} -eq 0 # 1 # (should be 1; i get the fallback cert.)
