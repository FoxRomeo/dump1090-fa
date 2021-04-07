# dump1090-fa

<a href="https://hub.docker.com/r/intrepidde/arm32v6-dump1090-fa"><img src="https://img.shields.io/docker/pulls/intrepidde/arm32v6-dump1090-fa.svg?style=plastic&logo=appveyor" alt="Docker pulls"/></a> arm32v6 container<br>
<a href="https://hub.docker.com/r/intrepidde/arm64v8-dump1090-fa"><img src="https://img.shields.io/docker/pulls/intrepidde/arm64v8-dump1090-fa.svg?style=plastic&logo=appveyor" alt="Docker pulls"/></a> arm64v8 container<br>

__Build a docker container with dump1090-fa for arm32v6 (and if working arm64v8) for rtlsdr, bladerf devices__

## work in progress
### ToDo
- change to non-root user


## Usage
docker run -d --restart unless-stopped --privileged --net host --name dump1090 intrepidde/arm32v6-dump1090-fa:latest
(working on non-root version and was to lazy to define all ports)

__based on arm32v6/alpine:3.12 (due to restrictions with newer versions) and arm64v8/alpine:latest__

