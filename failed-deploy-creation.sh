export REPOSITORY_NAME=hughbrien
echo "# # # # # # # # # # # # # failed-deploy-creation-config-error  # # # # # # # # # # # # # # #"
sleep 5
echo "Running failed-deploy-creation-config-error tutorial. Creating a Healthy Deployment of NGINX"

kubectl apply -f  https://raw.githubusercontent.com/${REPOSITORY_NAME}/komodor-tutorials/master/deploys-scenarios/failed-deploy-creation-config-error/healthy-deploy.yaml
open https://app.komodor.com/services?textFilter=komodor-create-container-config-error
sleep 60

kubectl apply -f  https://raw.githubusercontent.com/${REPOSITORY_NAME}/komodor-tutorials/master/deploys-scenarios/failed-deploy-creation-config-error/createcontainerconfigerror.yaml
sleep 10
open https://app.komodor.com/services?textFilter=komodor-create-container-config-error
