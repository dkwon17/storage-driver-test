#!/bin/bash

# This script will output the following in a newline:
# num_of_writes, trial_number, timing, bytes
build() {
    if [ -z "$IMAGE" ]; then
        podman build -f ./build/layertest/layertest_$1.Dockerfile . --quiet > /dev/null
    else
        podman build -f ./build/layertest/layertest_$1.Dockerfile --build-arg="IMAGE=$IMAGE" . --quiet > /dev/null
    fi
}

reset_podman() {
    # remove dangling containers
    buildah rm --all > /dev/null
    podman system reset --force > /dev/null
}

reset_podman

# Loop over 2^1 to 2^16
for (( i = 0; i < 7; i++ )); do
    num_of_writes=$((2 ** ($i)))
    for (( trial = 0; trial < 3; trial++ )); do
        reset_podman
        echo -n "$num_of_writes, $trial,"
        start=$(date +%s%3N)
        build "$num_of_writes"
        timing=$(($(date +%s%3N) - start))
        echo -n "$timing,"
        echo $(du -sb ~/.local/share/containers/storage | awk '{print $1}')
    done
done
