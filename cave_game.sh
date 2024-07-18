#!/bin/bash

CONNECTOR="$(curl https://mc.daedalist.net/api/v1/connector_string)";

HOLESAIL_LINUX_x86_64="https://github.com/holesail/holesail/releases/download/1.6.1/holesail-linux-x64-unsigned";
HOLESAIL_FILE_NAME_LINUX_x86_64="holesail-linux-x64-unsigned";

HOLESAIL_LINUX_aarch64="https://github.com/holesail/holesail/releases/download/1.6.1/holesail-linux-arm64-unsigned";
HOLESAIL_FILE_NAME_LINUX_aarch64="holesail-linux-arm64-unsigned";

CACHE="$HOME/.cave_game";
ARCH="$(uname -m)";



if [[ "$ARCH" == "x86_64" ]]; then
	HOLESAIL_FILE_NAME="$HOLESAIL_FILE_NAME_LINUX_x86_64";
	HOLESALE="$HOLESAIL_LINUX_x86_64";
elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
	HOLESAIL_FILE_NAME="$HOLESAIL_FILE_NAME_LINUX_aarch64";
	HOLESALE="$HOLESAIL_LINUX_aarch64";
fi

if [[ ! -d "$CACHE" ]]; then
    echo "creating $CACHE";
	mkdir $CACHE;
fi

pushd $CACHE;

if [[ ! -f "$HOLESAIL_FILE_NAME" ]]; then
    echo "Downloading $HOLESAIL_FILE_NAME";
	
    curl -L -O $HOLESALE;
	chmod +x $HOLESAIL_FILE_NAME;
fi

./$HOLESAIL_FILE_NAME --port 25565 $CONNECTOR;

popd;
