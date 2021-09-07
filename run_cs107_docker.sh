#!/usr/bin/env bash
set -e

if [[ $# -ne 1 ]]; then
    cat <<EOF
USAGE: ${0} <relative/path/to/pp-exercise/dir>

You must specify the relative path to the current pair-programming exercise
directory. You may want to use your git repository for this, for example:

cs107_firstname_lastname/pair_programming/PP1

assuming the cs107_firstname_lastname directory is located in your current
directory.  You can access this directory inside the container at
/pair-programming.

The docker image can be obtained by

docker pull cs107sysdev/ubuntu

from the docker.io registry.

Installing docker:

Mac:     https://docs.docker.com/desktop/mac/install/
Windows: https://docs.docker.com/desktop/windows/install/ (requires WSL 2, see System Requirements)
Linux:   Use your repository package manager.  E.g. for Ubuntu
         https://phoenixnap.com/kb/install-docker-on-ubuntu-20-04
         Alternatively, you can install podman which is a rootless alternative
         to docker (https://podman.io/)
EOF
    exit 1
fi

WD=/pair-programming
docker run \
    -v $(pwd)/${1}:${WD} -w ${WD} -e HOME=${WD} \
    -it --rm cs107sysdev/ubuntu:latest
exit 0
