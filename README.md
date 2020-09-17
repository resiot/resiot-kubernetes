# resiot-kubernetes
This project contains the init container used in Kubernetes (k8s) and the ResIOT Deployment definition. These manifests will allow you to deploy a fully formed ResIOT cluster in minutes.


## Usage:
### Configure:
Set environment variables (modify if necessary):
```sh
export APP_NAME=resiot
export NAMESPACE=default
export RESIOT_NODES=1
```
All parameters are required.
### Configuring Storage:
The [deployment definition](manifests/deployment.yaml) refers to a custom StorageClass `ssd`.

You can find the storageclass `ssd` definition in [ssd-aws-storageclass.yaml](manifests/ssd-aws-storageclass.yaml) or [ssd-gcp-storageclass.yaml](manifests/ssd-gcp-storageclass.yaml) (Uncomment them to use). You can also define your own storageclass and use it within the deployment definition.

### Deployment:
Please follow the below steps or run `start.sh` script:
1. Expand manifest template:
```sh
cat manifests/* | envsubst > expanded.yaml
```
2. Create the configmap object:
```sh
kubectl create configmap aerospike-conf -n $NAMESPACE --from-file=configs/
```
3. Deploy:
```sh
kubectl create -f expanded.yaml
```

## Requirements
* Kubernetes 1.8+