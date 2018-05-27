#!/bin/bash

set -e

bash bin/tls-monitor.sh mozilla-modern.badssl.com 7

exitCode=$?

test ${exitCode} -eq 0
