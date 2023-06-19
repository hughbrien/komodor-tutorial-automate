#!/bin/sh
export REPOSITORY_NAME=hughbrien
export NAMESPACE=developer-demo
#export REPOSITORY_NAME=komodorio

# Run kubenetes Deployments
# Automate the Komodor Tutorials https://github.com/${REPOSITORY_NAME}/komodor-tutorials

kubernetes delete namespace -n ${NAMESPACE}


