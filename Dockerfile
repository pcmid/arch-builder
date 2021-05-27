FROM archlinux:base-devel
MAINTAINER pcmid <plzcmid@gmail.com>

ADD makepkg.conf /
ADD set_conf.sh /

RUN pacman --sync --refresh --sysupgrade --noconfirm git \
    && pacman --sync --clean --clean --noconfirm \
    && find /var/cache/pacman/pkg -mindepth 1 -delete \
    && useradd abs -m \
    && mkdir -p /build /packages \
    && chown abs:abs /build /packages /makepkg.conf

ENV PKGDEST /packages

VOLUME /packages
USER abs
WORKDIR /build

CMD ["makepkg", "--config", "/makepkg.conf", "-csf"]
