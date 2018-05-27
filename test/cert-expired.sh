#!/bin/bash

bash bin/tls-monitor.sh expired.badssl.com 7

exitCode=$?

test ${exitCode} -eq 1
