#!/usr/bin/bash
/usr/local/bin/immich --url http://192.168.1.10:2283 --key NVLbpxYe2ZyAqCnaLNiykEc5eEF2rWtiP4h4ins29I upload /media/indra/ --recursive --delete && udiskie-umount --all
