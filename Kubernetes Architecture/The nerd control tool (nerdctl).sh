#!/bin/bash

# Comparision with Docker command

# docker
nerdctl

# docker run --name redis redis:alpine 
nerdctl run --name redis redis:alpine

# docker run --name webserver -p 80:80 -d nginx
nerdctl run --name webserver -p 80:80 -d nginx

