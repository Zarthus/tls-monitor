#!/bin/bash

TemporaryFileStorage="./cert_will_expire.txt"

if [[ -z $1 || -z $2 ]]; then
    echo "Usage: $0 <website> <expiry_in_days> [port]"
    exit 1
fi

ReminderWhenDaysLeft="$2"
ServerToCheck="$1"
if [[ -z $3 ]]; then
    PortToCheck=443
else
    PortToCheck=$3
fi
ExitCode=0
ProgramDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

openssl s_client -connect "$ServerToCheck":"$PortToCheck" -servername "$ServerToCheck" <<< 'Q' 2>/dev/null \
    | openssl x509 -noout -dates > ${TemporaryFileStorage} \
    | true # always succeed

ExpireInfo=$(tail -1 < $TemporaryFileStorage)
ExpiryDate=$(date --date="$(echo "$ExpireInfo" | grep -o -P '(?<==).*')" --iso-8601)

"$ProgramDirectory"/date-check.py "$ExpiryDate" "$ReminderWhenDaysLeft" "$PortToCheck"
CheckDateExitCode=$?

if [[ "$CheckDateExitCode" -eq 1 ]]; then
    ExitCode=$((ExitCode + 1))
    cat ${TemporaryFileStorage}
    echo
fi

rm "$TemporaryFileStorage"
exit "$ExitCode"
