# Docker-engine in Centos Container

This repo provides the docker engine that runs in the centos image.

## 2 ways to run it:

1. docker run -d **--privileged** ljm625/docker-centos
2. docker run -d **-v /sys/fs/cgroup:/sys/fs/cgroup:ro** ljm625/docker-centos

### Any questions, please submit a issue here, thanks!