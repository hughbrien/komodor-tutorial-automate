#!/bin/sh



# Run kubenetes Deployments
# Automate the Komodor Tutorials https://github.com/komodorio/komodor-tutorials

echo "# # # # # # # # # # # # # a-simple-deploy-with-a-configmap-change  # # # # # # # # # # # # # # # # #"


kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/deploys-scenarios/a-simple-deploy-with-a-configmap-change/step1.yaml

sleep 5
kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/deploys-scenarios/a-simple-deploy-with-a-configmap-change/step2.yaml

sleep 2
open https://app.komodor.com/services?textFilter=komodor-configmap-deploy

# Scenario: Investigate Failed Deploy Because Of a Bad Reference To a ConfigMap
# Many services are using ConfigMaps to separate the code from the running configuration.
# In a case where there is a reference in a deployment to a non-exist config map.
# This bad ref causes failure to create the new pods.
# Real-Life Example
# A user wants to add a new configuration to the deployment, so it creates a new config map and changes the deployment configuration to get value from the config map.
# But the user ref to a configmap that is not in the cluster and maybe even a small typo. All of that will cause the pods to fail to be created.
# How Komodor Helps?
# Komodor detects the failed deploy, correlates it with the applied changes to the deployment configuration and the configmap,
# and shows exactly why the deploy failed with a clear explanation.

sleep 5
echo "# # # # # # # # # # # # # failed-deploy-creation-config-error  # # # # # # # # # # # # # # # # #"

echo "Running failed-deploy-creation-config-error tutorial"
kubectl apply -f  https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/deploys-scenarios/failed-deploy-creation-config-error/healthy-deploy.yaml
sleep 7
kubectl apply -f  https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/deploys-scenarios/failed-deploy-creation-config-error/createcontainerconfigerror.yaml
sleep 2
open https://app.komodor.com/services?textFilter=komodor-create-container-config-error


sleep 5

echo "# # # # # # # # # # # # # failed-deploy-image-pull-backoff  # # # # # # # # # # # # # # # # #"


kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/deploys-scenarios/failed-deploy-image-pull-backoff/nginx-image-healthy.yaml

sleep 5 
kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/deploys-scenarios/failed-deploy-image-pull-backoff/imagepullbackoff.yaml
open https://app.komodor.com/services?textFilter=failed-deploy-image-pull-backoff


# Run  Deployments Failures

echo " Running Deployment Failures"

sleep 5 

echo "# # # # # # # # # # # # #      OOM Killed         # # # # # # # # # # # # # # # # # # # # # #"

echo "Runing OOM Killed "

kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/failure-scenarios/OOMKilled/oom.yaml

open "https://app.komodor.com/services?textFilter=komodor-oomkilled"


echo "# # # # # # # # # # # # # application-error-with-exception  # # # # # # # # # # # # # # # # #"

echo "Running application-error-with-exception"

echo "Deploying a Health services "
kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/failure-scenarios/application-error-with-exception/simple-application.yaml


echo "Now Breaking the application "
kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/failure-scenarios/application-error-with-exception/application-error.yaml


echo "# # # # # # # # # # # # # failed-to-schedule-pods  # # # # # # # # # # # # # # # # #"


kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/failure-scenarios/failed-to-schedule-pods/healthy-deploy.yaml

Echo "It takes 10 minutes for the failure to take place"
sleep 5
kubectl apply -f https://raw.githubusercontent.com/komodorio/komodor-tutorials/master/failure-scenarios/failed-to-schedule-pods/failed-scheduling.yaml

Echo "Deployments End"


