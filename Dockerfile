FROM archlinux:base-devel
MAINTAINER pcmid <plzcmid@gmail.com>

RUN pacman --sync --refresh --sysupgrade --noconfirm git sudo \
    && pacman --sync --clean --clean --noconfirm \
    && find /var/cache/pacman/pkg -mindepth 1 -delete \
    && useradd abs -m \
    && mkdir -p /build /packages \
    && chown abs:abs /build /packages \
    && echo "abs ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER abs

VOLUME /packages
ENV PKGDEST /packages
WORKDIR /build

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
