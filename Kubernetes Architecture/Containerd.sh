#!/bin/bash

# Pull the Redis image from Docker Hub
ctr image pull docker.io/library/redis:alpine

# Run Redis image
ctr
ctr run docker.io/library/redis:alpine redis
