#!/bin/bash

TemporaryFileStorage="./cert_will_expire.txt"

if [[ "x$2" == "x" || "x$1" == "x" ]]; then
    echo "Usage: $0 <website> <expiry_in_days> [port]"
    exit 1
fi

ReminderWhenDaysLeft=$2
ServerToCheck=$1
if [[ "x$3" == "x" ]]; then
    PortToCheck=443
else
    PortToCheck=$3
fi
ExitCode=0
ProgramDirectory="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

openssl s_client -connect ${ServerToCheck}:${PortToCheck} <<< 'Q' 2>/dev/null \
    | openssl x509 -noout -dates > ${TemporaryFileStorage} \
    | true # always succeed

ExpireInfo=$(cat ${TemporaryFileStorage} | tail -1)
ExpiryDate=`date --date="$(echo $ExpireInfo | grep -o -P '(?<==).*')" --iso-8601`

$ProgramDirectory/date-check.py "$ExpiryDate" "$ReminderWhenDaysLeft" "$PortToCheck"
CheckDateExitCode=$?

if [[ $CheckDateExitCode -eq 1 ]]; then
    ExitCode=$(($ExitCode + 1))
    echo "Close to expiry: $url"
    cat ${TemporaryFileStorage}
    echo
fi

rm ${TemporaryFileStorage}
exit $ExitCode
