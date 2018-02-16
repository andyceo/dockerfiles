This is containerized version of easy-to-use TFTP server `tftpd-hpa`.

Inspired by [vpommier/tftp-hpa](https://hub.docker.com/r/vpommier/tftp-hpa/), greate work, but have not update for 2+ years.


## Image Badges

@todo


## Run

    docker run -d -v tftpboot:/tftpboot andyceo/tftpd-hpa


## Volumes

- **`/tftpboot:rw`** - folder that store network bootable firmwares
