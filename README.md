# Metrics and Default Web Module #

This repo shows that the /metrics endpoint doesn't work when a default web module is defined.

# Prerequisites

You need

- java8
- docker
- docker-compose
- maven

# Install

First start payara:

    docker-compose up -d

Wait a few seconds for it to startup and then run:

    ./build.sh

This will

- build a hello world rest web app and deploy it

# Test

When the webapp is deployed you can run

    ./test.sh

This will call the rest api and return

    Hello World

# Metrics test

You can call the metrics endpoint by calling

    ./metrics.sh
    
This will produce e.g:

    # TYPE vendor_system_cpu_load gauge
    # HELP vendor_system_cpu_load Display the "recent cpu usage" for the whole system. This value is a double in the [0.0,1.0] interval. A value of 0.0 means that all CPUs were idle during the recent period of time observed, while a value of 1.0 means that all CPUs were actively running 100% of the time during the recent period being observed. All values betweens 0.0 and 1.0 are possible depending of the activities going on in the system. If the system recent cpu usage is not available, the method returns a negative value.
    vendor_system_cpu_load 0.16666666666666666
    # TYPE base_memory_maxHeap_bytes gauge
    # HELP base_memory_maxHeap_bytes Displays the maximum amount of memory in bytes that can be used for HeapMemory.
    base_memory_maxHeap_bytes 7.29808896E9
    # TYPE base_memory_committedNonHeap_bytes gauge
    .
    .
    
# The problem

Set the default web module:

    ./set-default-web-module.sh
    
Run the metrics endpoint

    ./metrics.sh

Result

    .
    .
    < HTTP/1.1 404 Forbidden
    .
    .
    
This kind of makes sense because the default web app is being called so it will probably try to execute /test-web/metrics.

So the big question now is how to access the metrics.
