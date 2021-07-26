#!/bin/bash

init() {
    sudo chown abs /build /packages

    cp /etc/makepkg.conf /tmp/makepkg.conf
    echo 'MAKEFLAGS="-j'$(nproc)'"' >> /tmp/makepkg.conf

    source ./PKGBUILD
    for key in ${validpgpkeys[@]};do
        echo "Adding key ${key}..."
        gpg --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 "${key}" || break
    done
    echo "init done"
}

build_package() {
    sudo pacman --sync --refresh --sysupgrade --noconfirm
    makepkg --config /tmp/makepkg.conf --syncdeps --noconfirm --needed --cleanbuild --clean --force --sign
}

init
build_package
