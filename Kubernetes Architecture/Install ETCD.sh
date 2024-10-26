#!/bin/bash

# Download Binaries
curl -L https://github.com/etcd-io/etcd/releases/download/v3.3.11/etcd-v3.3.11-linux-amd64.tar.gz -o etcd-v3.3.11-linux-amd64.tar.gz

# Extract
tar xzvf etcd-v3.3.11-linux-amd64.tar.gz

# Run ETCD Service
./etcd

# To store a key-value pair
./etcdctl set key1 value1

# To retrieve the stored data
./etcdctl get key1
# Output: value1

# To view more options
./etcdctl

# Check the configured version of ETCDCTL
./etcdctl --version
# output:
# etcdctl version: 3.3.11 # ETCDCTL utility itself
# API version: 2 # API
# Note: with the release of version 3.4 the default API version is set to 3

# To chagne ETCDCTL to work with the API v3.0
  # Set the environment variable before running the command
ETCDCTL_API=3 ./etcdctl version

# OR
# Export it as an environment variable for the entire session
export ETCDCTL_API=3 
./etcdctl version

# ETCDCTL v3
# To set a value
./etcdctl put key1 value1

# Output:
# OK

# To get a value
./etcdctl get key1

# Output:
# key1
# value1
