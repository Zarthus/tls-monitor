#!/usr/bin/env python

from datetime import datetime
import sys


if len(sys.argv) < 3:
    raise 'Usage: %s <expiring_time: UTC Y-m-d> <offset: int>'.format(sys.argv[0])

expiring_time = str(sys.argv[1])
offset = int(sys.argv[2])

expires_at = datetime.strptime(expiring_time, "%Y-%m-%d")
today = datetime.utcnow()

difference = (expires_at - today).days

if difference > offset:
    sys.exit(0)

sys.exit(1)
