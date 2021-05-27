#!/bin/sh

init() {
    cp /etc/makepkg.conf /tmp/makepkg.conf
    echo 'MAKEFLAGS="-j'$(nproc)'"' >> /tmp/makepkg.conf
}

build() {
    makepkg --config /tmp/makepkg.conf --syncdeps --noconfirm --needed --noprogressbar --cleanbuild --clean --force --sign
}

init
build
