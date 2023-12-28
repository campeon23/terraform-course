#!/bin/bash
set -ex
AWS_REGION="us-east-1"
cd jenkins-packer-demo || exit
S3_BUCKET=$(aws s3 ls --region $AWS_REGION | awk '{for (i=1; i<=NF; i++) if ($i ~ /^terraform-state/) print $i}' | head -n1)
sed -i 's/terraform-state-xx70dpnh/'${S3_BUCKET}'/' backend.tf
sed -i 's/#//g' backend.tf
aws s3 cp s3://${S3_BUCKET}/amivar.tf amivar.tf --region $AWS_REGION
terraform init
terraform apply -auto-approve -var APP_INSTANCE_COUNT=1 -target aws_instance.app-instance
