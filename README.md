# Helm Chart Example for a Kubernetes Pod that syncs configs from AWS s3

## Getting Started

The Docker image requires 4 env variables be set:
1. **$PATH** - The Folder within the container that will contain the configs to sync
2. **$BUCKET** - The url of the s3 bucket in the format **s3://mybucket**
3. **$AWS_SECRET_ACCESS_KEY** - Your AWS ACCESS KEY
4. **$AWS_ACCESS_KEY_ID** - Your SECRET KEY