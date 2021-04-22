FROM archlinux:base-devel
MAINTAINER pcmid <plzcmid@gmail.com>

RUN useradd abs -m \
    && mkdir -p /build /packages \
    && chown abs:abs /build /packages

ENV PKGDEST /packages

VOLUME /packages
USER abs
WORKDIR /build

CMD ["makepkg", "-csf"]
