# TLS Monitor

Monitors existing infrastructure for expiring TLS certificates.

This was written to function on a CI or with a cronjob.

It requires python and bash.

## Usage

```bash
                     vvvvvv the name of the website
./bin/tls-monitor.sh string int int
                                ^^^ optional port (defaults to 443)
                            ^^^ number of days left (on expire time) before 
                                we consider the build a failure

./bin/tls-monitor.sh yourwebsite.com 7
```
