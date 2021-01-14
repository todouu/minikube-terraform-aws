# minikube-terraform-aws
a aws terraform code to install minikube quickly 


# How to use
1. install terraform 0.14.4
2. update backend file, change the S3 bucket to your bucket, and also input your ip to main local input.
3. terraform init --> terraform plan --> terraform apply.
4. you can find the key from terraform state file at S3 bucket.
5. just wait until ec2 start up ;)