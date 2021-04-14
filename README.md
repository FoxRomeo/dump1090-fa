# dump1090-fa

<a href="https://hub.docker.com/r/intrepidde/arm32v6-dump1090-fa"><img src="https://img.shields.io/docker/pulls/intrepidde/arm32v6-dump1090-fa.svg?style=plastic&logo=appveyor" alt="Docker pulls"/></a> arm32v6 container<br>
<a href="https://hub.docker.com/r/intrepidde/arm64v8-dump1090-fa"><img src="https://img.shields.io/docker/pulls/intrepidde/arm64v8-dump1090-fa.svg?style=plastic&logo=appveyor" alt="Docker pulls"/></a> arm64v8 container<br>

__Build a docker container with dump1090-fa for arm32v6 (and if working arm64v8) for rtlsdr, bladerf devices__

## work in progress
__(First tests successful combined with mikenye/fr24feed:latest_arm_v6 on different RPis)__


## Available Parameters
Usage is similar to direct dump1090 usage
```QUIET```                 != 0 to enable quiet                  
```LAT <latitude>```        Reference/receiver latitude for surface posn
```LON <longitude>```       Reference/receiver longitude for surface posn
```WISDOM_PATH <path>```    Path to wisdom files (so not set to use includes files)
```BIND-ADDRESS <ip>```     IP address to bind to (default: Any; Use 127.0.0.1 for private)
```RI-PORT <ports>```       TCP raw input listen ports  (default: 30001)
```RO-PORT <ports>```       TCP raw output listen ports (default: 30002)
```SBS-PORT <ports>```      TCP BaseStation output listen ports (default: 30003)
```BI-PORT <ports>```       TCP Beast input listen ports  (default: 30004,30104)
```BO-PORT <ports>```       TCP Beast output listen ports (default: 30005)
```STRATUX-PORT <ports>```  TCP Stratux output listen ports (default: disabled)


## Usage
```docker run -d --restart unless-stopped --privileged -e QUIET=1 -p 30001-30005:30001-30005 --name dump1090 intrepidde/arm32v6-dump1090-fa:latest```

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

