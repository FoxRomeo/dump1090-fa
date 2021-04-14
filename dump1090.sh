#!/bin/bash

if [ -z "${DEFAULT_PARAMETERS}" ]; then
 PARAMS="--net --fix --modeac --enable-df24 --forward-mlat"
else
 PARAMS="${DEFAULT_PARAMETERS}"
fi

if [ -n "${QUIET}" && "{QUIET}" != "0" ]; then
 PARAMS="${PARAMS} --quiet"
fi

if [ -n "${LAT}" ]; then
 PARAMS="${PARAMS} --lat ${LAT}]"
fi

if [ -n "${LON}" ]; then
 PARAMS="${PARAMS} --lon ${LON}"
fi

if [ -n "${WISDOM_PATH}" ]; then
 PARAMS="${PARAMS} --wisdom ${WISDOM_PATH}"
else
 PARAMS="${PARAMS} --wisdom /etc/dump1090-fa/wisdom.local"
fi

if [ -n "${BIND_ADDRESS}" ]; then
 PARAMS="${PARAMS} --net-bind-address ${BIND_ADDRESS}"
fi

if [ -n "${RI_PORT}" ]; then
 PARAMS="${PARAMS} --net-ri-port ${RI_PORT}"
fi
if [ -n "${RO_PORT}" ]; then
 PARAMS="${PARAMS} --net-ro-port ${RO_PORT}"
fi

if [ -n "${SBS_PORT}" ]; then
 PARAMS="${PARAMS} --net-sbs-port ${SBS_PORT}"
fi

if [ -n "${BI_PORT}" ]; then
 PARAMS="${PARAMS} --net-bi-port ${BI_PORT}"
fi
if [ -n "${BO_PORT}" ]; then
 PARAMS="${PARAMS} --net-bo-port ${BO_PORT}"
fi

if [ -n "${STRATUX_PORT}" ]; then
 PARAMS="${PARAMS} --write-json ${JSON_PATH}"
fi
if [ -n "${STRATUX_PORT}" ]; then
 PARAMS="${PARAMS} --write-json-every ${JSON_EVERY}"
fi
if [ -n "${STRATUX_PORT}" ]; then
 PARAMS="${PARAMS} --json-stats-every ${JSON_STATS}"
fi


if [ -n "${ADDITIONAL_PARAMS}" ]; then
 PARAMS="${PARAMS} ${ADDITIONAL_PARAMS}"
fi


/usr/local/bin/dump1090 $PARAMS

exit 1
