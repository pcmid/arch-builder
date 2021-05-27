#!/bin/sh

echo 'MAKEFLAGS="-j'$(nproc)'"' >> makepkg.conf
