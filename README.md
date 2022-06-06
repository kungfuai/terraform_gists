## Spinning Up an Evaluation Instance 
To get started, make sure you have Terraform and AWS CLI installed. If you don't, please navigate to https://learn.hashicorp.com/tutorials/terraform/install-cli to get Terraform installed and to https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html to get AWS CLI installed.

### Log into Your AWS Account with the CLI
The first thing to do is to ensure that you are logged into your account. Run:
```
aws configure
```
to get started. Enter your Access Key ID, Secret Key and us-west-2 for the default region.

### Creating the Bucket to Manage Terraform State
Then, run the command
```
ec2_instances/bin/create_backend_store.sh
```
to create the backend store bucket for the Terraform scripts in S3 in your AWS Account. You only need to run this command the very first time you run Terraform - if the bucket already exists (this Terraform script has run once), then you can skip this step.

### Provisioning Resources with Terraform
Next, you just run the Terraform commands:
```
cd ec2_instances/infrastructure && terraform init
```
to initialize the Terraform scripts. Once that finishes, you can run
```
terraform plan
```
to plan out the deployment and finally
```
terraform apply -auto-approve
```
to apply the deployment plan.

Once you've deployed your resources, you can navigate to the console (specifically EC2 in this case) to check on them. If the apply worked, you should see the resources in the Management Console.

### Connecting to the Evaluation Instance
Finally, to log in to your EC2 instance, make sure that you have the private key and public key for the EC2 instance saved somewhere. Make sure that the private key NEVER leaves your computer. Once you have the keys, you can run
```
ssh -i "Allix5EvaluationKey.pem" ubuntu@ec2-35-87-108-209.us-west-2.compute.amazonaws.com
```
to log into the EC2 instance.

## Contact
Please reach out to krishi.sharma@kungfu.ai for help.
