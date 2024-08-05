FROM registry.opensuse.org/opensuse/tumbleweed:latest

ARG BUILD_DATE

LABEL summary="OpenSUSE Systemd Container Image."
LABEL maintainer="Uco Mesdag <uco@mesd.ag>"
LABEL build-date=${BUILD_DATE}

ENV container=podman

# Enable systemd and install required packages.
RUN zypper install -y systemd sudo python3 && zypper clean -a && \
    (cd /usr/lib/systemd/system/sysinit.target.wants/ ; for i in * ; do [ $i = systemd-tmpfiles-setup.service ] || rm -f $i ; done) ; \
    rm -rf /var/log/zypp /var/log/zypper.log ; \
    rm -f /usr/lib/systemd/system/multi-user.target.wants/* ; \
    rm -f /etc/systemd/system/*.wants/* ; \
    rm -f /usr/lib/systemd/system/local-fs.target.wants/* ; \
    rm -f /usr/lib/systemd/system/sockets.target.wants/*udev* ; \
    rm -f /usr/lib/systemd/system/sockets.target.wants/*initctl* ; \
    rm -f /usr/lib/systemd/system/basic.target.wants/* ; \
    rm -f /usr/lib/systemd/system/anaconda.target.wants/*

VOLUME ["/sys/fs/cgroup"]
CMD ["/sbin/init"]
