FROM docker.io/library/rockylinux:9

RUN dnf install -y systemd sudo passwd \
    && dnf clean all && rm -rf /var/cache/dnf \
    && systemctl mask systemd-udevd.service systemd-udev-trigger.service \
        getty.target console-getty.service systemd-logind.service

STOPSIGNAL SIGRTMIN+3

CMD ["/usr/sbin/init"]
