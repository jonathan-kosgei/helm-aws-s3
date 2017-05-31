# Helm Chart for AWS S3 reader

## Getting Started

The Docker image requires 4 env variables be set:
1. **$SYNC_PATH** - The Folder within the container that will contain the configs to sync
2. **$BUCKET** - The url of the s3 bucket in the format **s3://mybucket**
3. **$OPSC_ENV** - The name of the environment. Can be one of `dev`, `qa`, `prod` or `staging` etc., so long as you have created a secret named **$OPSC_ENV-aws-secret**

## Using the Helm Chart

Clone this repo and create a config.yaml file to set the above environment variables

```
$ cat config.yaml
BUCKET: s3://mybucket
SYNC_PATH: /config
OPSC_ENV: dev
```
Then to install this helm run
```
helm install -f config.yaml helm/aws-s3-reader-0.1.0.tgz
```
For different environments i.e. `dev`, `staging`, `qa`, `prod` set `OPSC_ENV` to either one of `dev`, `qa`, `prod` or `staging`.
This value will be prepended to the base secret name in the helm chart's values.yaml (that is $OPSC_ENV-aws-secret) to create a reference to either one of;
`dev-aws-secret`, `qa-aws-secret`, `prod-aws-secret` or `staging-aws-secret`

For example, create a file `dev-config.yaml` to hold the configs for your dev environment i.e. the bucket name and aws credentials
```
$ cat dev-config.yaml
BUCKET: s3://dev-bucket
SYNC_PATH: /config
OPSC_ENV: dev
```

**_Note:_**
You will need to create a secret for each environment

Then run
```
helm install -f dev-config.yaml helm/aws-s3-reader-0.1.0.tgz
```
And so on for as many environments as you'd like

## Creating the Kubernetes secrets

Create a file `dev-aws-secret.yaml` with the following;
```
apiVersion: v1
kind: Secret
metadata:
  name: dev-aws-secret
type: Opaque
data:
  AWS_SECRET_ACCESS_KEY: Your AWS_SECRET_ACCESS_KEY for the dev environment
  AWS_ACCESS_KEY_ID: Your AWS_ACCESS_KEY_ID for the dev environment
```

Create the secret with 
```
kubectl apply -f dev-aws-secret.yaml
```

Do this for each environment you plan to have