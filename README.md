# storage-driver-test

# run_layer_test.sh
This test randomly edits a 16KB file, of an image that contains 4096 16KB files (total image size is about 65536 kilobytes = 64mb).

The purpose of this test is to see how increasing the number of layers affects the build time and storage usage.

The base image was built by running:
```
podman build -f ./build/Dockerfile --build-arg="FILES_CREATE=4096" --build-arg="FILE_SIZE=16K" -t quay.io/dkwon17/storage-driver-test:layer-image .
```

The tests are run by running:
```
$ time podman build -f ./build/layertest/layertest_64.Dockerfile -t quay.io/dkwon17/storage-driver-test:test64 .
$ du -h -d 1 ~/.local/share/containers/storage
```

### Running the tests sequentially
To run the tests sequentially with an increasing layer count, run:
```
$ mkdir results
$ ./scripts/run_layertest.sh > ./results/run_layertest 2>&1
```

The tests are run by running:
```
$ time podman build -f ./build/layertest/layertest_64.Dockerfile -t quay.io/dkwon17/storage-driver-test:test64 .
$ du -h -d 1 ~/.local/share/containers/storage
```

# run_test.sh
This test creates multiple files with a size of 4K in a `/test` directory.

The purpose of this test is to see how writing an increasing number of data in one layer affects the build time and storage usage.

### Running the test
```
$ NUM_FILES=1
$ time podman build -f ./build/Dockerfile --build-arg="FILES_CREATE=$NUM_FILES" --build-arg="FILE_SIZE=4K" . 
# check graphroot size
$ du -h -d 1 ~/.local/share/containers/storage
```

### Running the tests sequentially
To run the tests sequentially with an increasing file count, run:
```
$ mkdir results
$ ./scripts/run_test.sh > ./results/run_test_out 2>&1
```

The tests are run by running:
```
$ time podman build -f ./build/layertest/layertest_64.Dockerfile -t quay.io/dkwon17/storage-driver-test:test64 .
# check graphroot size
$ du -h -d 1 ~/.local/share/containers/storage
```
