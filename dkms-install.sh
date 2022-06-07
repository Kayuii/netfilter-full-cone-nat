#!/bin/bash

PKG_DIR="$(pwd)"
PKG_NAME=fullconenat
PKG_VERSION=1.0

cp -r ${PKG_DIR} /usr/src/${PKG_NAME}-${PKG_VERSION}

dkms install -m ${PKG_NAME} -v ${PKG_VERSION}
