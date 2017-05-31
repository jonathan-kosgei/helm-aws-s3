# Helm Chart for AWS S3 reader

## Getting Started

The Docker image requires 4 env variables be set:
1. **$SYNC_PATH** - The Folder within the container that will contain the configs to sync
2. **$BUCKET** - The url of the s3 bucket in the format **s3://mybucket**
3. **$KUBERNETES_SECRET_NAME** - The name of the Kubernetes secret for that particukar environment

## Using the Helm Chart

Clone this repo and create a config.yaml file to set the above environment variables

```
$ cat config.yaml
BUCKET: s3://mybucket
SYNC_PATH: /config
KUBERNETES_SECRET_NAME: aws-secret
```
Then to install this helm run
```
helm install -f config.yaml helm/aws-s3-reader-0.1.0.tgz
```
For different environments i.e. `dev`, `staging`, `qa`, `prod` create different named files with different configs eg.
```
$ cat dev-config.yaml
BUCKET: s3://dev-bucket
SYNC_PATH: /config
KUBERNETES_SECRET_NAME: dev-aws-secret
```

```
Then run
helm install -f dev-config.yaml helm/aws-s3-reader-0.1.0.tgz
```
And so on for as many environments as you'd like

## Creating the Kubernetes secret

Create a file `dev-aws-secret.yaml` with the following;
```
apiVersion: v1
kind: Secret
metadata:
  name: dev-aws-secret
type: Opaque
data:
  AWS_SECRET_ACCESS_KEY: Your AWS_SECRET_ACCESS_KEY
  AWS_ACCESS_KEY_ID: Your AWS_ACCESS_KEY_ID
```

Create the secret with 
```
kubectl apply -f dev-aws-secret.yaml
```
