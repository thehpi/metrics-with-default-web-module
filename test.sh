#!/bin/bash

nr=${1:-4}

curl -s -v "http://localhost:48080/test-web/rest/hello/world"
