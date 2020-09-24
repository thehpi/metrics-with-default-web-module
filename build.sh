#!/bin/bash

nr=${1:-4}

mvn clean install

# undeploy to enable redeploy
asadmin --port=${nr}4848 undeploy test-web
asadmin --port=${nr}4848 deploy --upload=true target/test-web.war
