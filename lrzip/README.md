# Lrzip

Lrzip can be found at https://github.com/ckolivas/lrzip

This repository contain `lrzip` utility compiled under last Alpine version for extremely effective text files compression.

This image does not contain any wrappers like `lrztar`, because it require `bash`, and even did not work properly with Alpine's `bash` version, so every wrapper was excluded to minimize image size.


## Quick start

    sudo docker run --rm -ti andyceo/lrzip

This will run `lrzip` inside container and show help. To actually compress some file, you need mount file from host system and directory where to store compressed result.


## Volumes

By default this image does not use any volumes. You must mount some to allow this utility do some work for you.


## Manual build

    sudo docker build --rm -t lrzip .
