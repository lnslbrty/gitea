#!/bin/sh

set -e
printf "BUILD FOR OPENWRT \${BUILD_OWRT}: %s\n" "${BUILD_OWRT:-disabled}"
set -x

cd $(dirname $0)
if [ "x${BUILD_OWRT}" != x ]; then
	export GOARCH=arm
	export GOOS=linux
	export GOARM=7
fi
go build -ldflags='-s -w' -tags "sqlite" .
