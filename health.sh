#!/bin/bash

EXITCODE=0


if [[ -z "${RI_PORT}" ]]; then
 RI_PORT=30001
fi
if netstat -an | grep "LISTEN" | grep "${RI_PORT}" > /dev/null; then
    echo "listening for connections on port ${RI_PORT}. HEALTHY"
else
    echo "not listening for connections on port ${RI_PORT}. UNHEALTHY"
    EXITCODE=1
fi

if [ -z "${RO_PORT}" ]; then
 RO_PORT=30002
fi
if netstat -an | grep LISTEN | grep "${RO_PORT}" > /dev/null; then
    echo "listening for connections on port ${RO_PORT}. HEALTHY"
else
    echo "not listening for connections on port ${RO_PORT}. UNHEALTHY"
    EXITCODE=1
fi

if [ -z "${SBS_PORT}" ]; then
 SBS_PORT=30003
fi
if netstat -an | grep LISTEN | grep ${SBS_PORT} > /dev/null; then
    echo "listening for connections on port ${SBS_PORT}. HEALTHY"
else
    echo "not listening for connections on port ${SBS_PORT}. UNHEALTHY"
    EXITCODE=1
fi

if [ -z "${BI_PORT}" ]; then
 BI_PORT=30004
fi
if netstat -an | grep LISTEN | grep ${BI_PORT} > /dev/null; then
    echo "listening for connections on port ${BI_PORT}. HEALTHY"
else
    echo "not listening for connections on port ${BI_PORT}. UNHEALTHY"
    EXITCODE=1
fi

if [ -z "${BO_PORT}" ]; then
 BO_PORT=30005
fi
if netstat -an | grep LISTEN | grep ${BO_PORT} > /dev/null; then
    echo "listening for connections on port ${BO_PORT}. HEALTHY"
else
    echo "not listening for connections on port ${BO_PORT}. UNHEALTHY"
    EXITCODE=1
fi


if [ -n "${JSON_PATH}" ]; then
 if [ -z "${JSON_STATS}" ]; then
  JSON_STATS=60
 fi
 TIMESTAMP_FILE=`date -r ${JSON_PATH}/stats.json "+%s"`
 TIMESTAMP_NOW=`date +%s`
 TIMESTAMP_DIFF=$(echo "($TIMESTAMP_NOW - $LOG_LAST_ENTRY_TIMESTAMP) < (${JSON_STATS} * 5)" | bc)
 if [ "$TIMESTAMP_DIFF" -eq 1 ]; then
  echo "file ${JSON_PATH}/stats.json modified. HEALTHY"
 else
  echo "file ${JSON_PATH}/stats.json not modified the last ${JSON_STATS} * 5 seconds. UNHEALTHY"
  EXITCODE=1
 fi	
 if [ -z "${JSON_EVERY}" ]; then
  JSON_EVERY=1
 fi
 TIMESTAMP_FILE=`date -r ${JSON_PATH}/receiver.json "+%s"`
 TIMESTAMP_NOW=`date +%s`
 TIMESTAMP_DIFF=$(echo "($TIMESTAMP_NOW - $LOG_LAST_ENTRY_TIMESTAMP) < ${JSON_EVERY} * 5)" | bc)
 if [ "$TIMESTAMP_DIFF" -eq 1 ]; then
  echo "file ${JSON_PATH}/receiver.json modified. HEALTHY"
 else
  echo "file ${JSON_PATH}/receiver.json not modified the last ${JSON_EVERY} * 5 seconds. UNHEALTHY"
  EXITCODE=1
 fi	
fi

exit $EXITCODE
