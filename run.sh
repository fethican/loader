#!/bin/bash
set -o pipefail

if [ -z "${IMAGE_TARBALL_URL}" ]; then
	echo "No image specified"
	exit 1
fi

wget -qO- "${IMAGE_TARBALL_URL}" | docker load
