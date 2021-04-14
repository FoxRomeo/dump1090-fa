# dump1090-fa

<a href="https://hub.docker.com/r/intrepidde/arm32v6-dump1090-fa"><img src="https://img.shields.io/docker/pulls/intrepidde/arm32v6-dump1090-fa.svg?style=plastic&logo=appveyor" alt="Docker pulls"/></a> arm32v6 container<br>
<a href="https://hub.docker.com/r/intrepidde/arm64v8-dump1090-fa"><img src="https://img.shields.io/docker/pulls/intrepidde/arm64v8-dump1090-fa.svg?style=plastic&logo=appveyor" alt="Docker pulls"/></a> arm64v8 container<br>

__Build a docker container with dump1090-fa for arm32v6 and arm64v8 for rtlsdr, bladerf devices__

## work in progress

__(First tests successful combined with mikenye/fr24feed:latest_arm_v6 each on a different RPi)__


## Available Parameters
Usage is similar to direct dump1090 usage

| Environment Variable | Purpose | Default |
| -------------------- | ------- | ------- |
| `QUIET` | != 0 to enable quiet | enabled |
| `LAT <latitude>` | Reference/receiver latitude for surface posn | - |
| `LON <longitude>` | Reference/receiver longitude for surface posn | - |
| `WISDOM_PATH <path>` | Path to wisdom files | /etc/dump1090-fa/wisdom.local |
| `BIND_ADDRESS <ip>` | IP address to bind to (Use 127.0.0.1 for private) | any |
| `RI_PORT <ports>` | TCP raw input listen ports | 30001 |
| `RO_PORT <ports>` | TCP raw output listen ports | 30002 |
| `SBS_PORT <ports>` | TCP BaseStation output listen ports | 30003 |
| `BI_PORT <ports>` | TCP Beast input listen ports | 30004 |
| `BO_PORT <ports>` | TCP Beast output listen ports | 30005 |
| `STRATUX_PORT <ports>` | TCP Stratux output listen ports | disabled |
| `JSON_DIR` | Periodically write json output to <dir> | - |
| `JSON_EVERY` | Write json aircraft output every t seconds | 1 |
| `JSON_STATS` | Write json stats output every t seconds | 60 |
| `ADDITIONAL_PARAMS` | custom additional parameters | - |
| `DEFAULT_PARAMETERS` | overwrite default parameters | --net --fix --modeac --enable-df24 --forward-mlat |

## Usage

```docker run -d --restart unless-stopped --privileged -e QUIET=1 --device /dev/bus/usb:/dev/bus/usb -p 30001-30005:30001-30005 --name dump1090 intrepidde/arm32v6-dump1090-fa:latest```

or

```
  dump1090-fa:
    image: intrepidde/arm32v6-dump1090-fa:latest
    container_name: dump1090-fa
    ports:
    - 30001-30005:30001-30005
    devices:
    - /dev/bus/usb:/dev/bus/usb
    environment:
    - LAT=x.xxxx
    - LON=y.yyyy
    - QUIET=1
    privileged: true
    restart: unless-stopped
```

__based on arm32v6/alpine:3.12 (due to restrictions with newer versions) and arm64v8/alpine:latest__

