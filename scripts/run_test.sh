#!/bin/bash

# This script will output the following in a newline:
# num_of_files, trial_number, timing, bytes
build() {
    if [ -z "$IMAGE" ]; then
        podman build -f ./build/Dockerfile --build-arg="FILES_CREATE=$1" --build-arg="FILE_SIZE=4K" . --quiet > /dev/null
    else
        podman build -f ./build/Dockerfile --build-arg="FILES_CREATE=$1" --build-arg="FILE_SIZE=4K" --build-arg="IMAGE=$IMAGE" . --quiet > /dev/null
    fi
}

reset_podman() {
    # remove dangling containers
    buildah rm --all > /dev/null
    podman system reset --force > /dev/null
}

# Loop over from 1 to 65536 in powers of 2
for (( i = 0; i < 17; i++ )); do
    num_of_files=$((2 ** ($i)))
    for (( trial = 0; trial < 3; trial++ )); do
        reset_podman
        echo -n "$num_of_files, $trial,"
        start=$(date +%s%3N)
        build "$num_of_files"
        timing=$(($(date +%s%3N) - start))
        echo -n "$timing,"
        echo $(du -sb ~/.local/share/containers/storage | awk '{print $1}')
    done
done
