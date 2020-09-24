#!/bin/bash

nr=${1:-4}

curl -s -v "http://localhost:${nr}8080/metrics"
