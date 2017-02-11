FROM centos:7
MAINTAINER "Jiaming LI" <ljm625@gmail.com>
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
RUN yum-config-manager \
    --add-repo \
    https://docs.docker.com/engine/installation/linux/repo_files/centos/docker.repo;
RUN yum -y install docker-engine epel-release; \
	systemctl enable docker;
RUN yum -y install vim git wget;
RUN yum -y install e2fsprogs-1.42.9-9.el7.x86_64;
VOLUME [ "/sys/fs/cgroup" ]
EXPOSE 9000
CMD ["/usr/sbin/init"]
