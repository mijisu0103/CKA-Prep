#!/bin/bash

crictl
crictl pull busybox
crictl images
crictl ps -a
crictl exec -i -t container_id ls
crictl logs log_id
crictl pods
