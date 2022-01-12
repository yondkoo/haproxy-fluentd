#!/bin/sh

set -o errexit
set -o nounset

readonly RSYSLOG_PID="/var/run/rsyslogd.pid"

main() {
  start_rsyslogd
  start_lb "$@"
}

start_rsyslogd() {
  rm -f $RSYSLOG_PID
  # avoiding (syslog error)
  # rm -rf /var/log/haproxy.log
  # touch /var/log/haproxy.log 
  rsyslogd
}

start_lb() {
  exec haproxy -W -db "$@"
}

main "$@"
