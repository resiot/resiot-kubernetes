# resiot-kubernetes
This project contains the init container used in Kubernetes (k8s) and the ResIOT Deployment definition. These manifests will allow you to deploy a fully formed ResIOT cluster in minutes.


## Usage:
### Configure:
Set environment variables (modify if necessary):
```sh
export APP_NAME=resiot
export NAMESPACE=default
export RESIOT_NODES=3
```
All other parameters are required.
### Configuring Storage:
The [deployment definition](manifests/deployment.yaml) refers to a custom StorageClass `ssd`.

