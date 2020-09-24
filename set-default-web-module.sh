#!/bin/bash

nr=${1:-4}

server -${nr} -cc 'set "configs.config.server-config.http-service.virtual-server.server.default-web-module=test-web"'
