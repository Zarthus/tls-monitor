# TLS Monitor

[![Build Status](https://travis-ci.org/Zarthus/tls-monitor.svg?branch=master)](https://travis-ci.org/Zarthus/tls-monitor)

Monitors existing infrastructure for expiring TLS certificates.

This was written to function on a CI or with a cronjob.

It requires python (2 and 3 both supported), openssl, and bash

## Usage

```bash
                     vvvvvv the name of the website
./bin/tls-monitor.sh string int int
                                ^^^ optional port (defaults to 443)
                            ^^^ number of days left (on expire time) before 
                                we consider the build a failure

./bin/tls-monitor.sh yourwebsite.com 7
```

## Tests

The unit tests connect directly to public services, notably badssl.com, please
do not run them too often.

To run them, run `make test` from the repo root.

## License

MIT
