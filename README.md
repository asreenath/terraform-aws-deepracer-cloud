# AWS Deepracer using Terraform

This code is inspired from [aws-deepracer-cloud](https://github.com/aws-deepracer-community/deepracer-for-cloud) and [terraform-aws-deepracer-cloud](https://github.com/nalbam/terraform-aws-deepracer-cloud)

Features -
<ul>
<li> Creates required infra using Terraform Cloud using remote backend</li>
<li> Can support multiple environments/runs using inputs from .tfvars files </li>
<li> Creates required infrastructure using Terraform </li>
<li> Supports multiple parallel runs of Deepracer on EC2 </li>
<li> Runs DeepRacer on EC2 Spot instances, making it most cost effective </li>
</ul>

# Pre-requisites

1. Create free tier [AWS Cloud account](https://aws.amazon.com/free/) 
2. Create free [Terraform Cloud account](https://app.terraform.io/)
3. Create an AWS User or AWS Assumable Role with appropriate permissions for terraform to be able to provision infrastructure
4. Install awscli, terraform cli and other required tool chain in your laptop/desktop
5. Using Terraform Cloud console UI, create and organizaiton and workspace

# Execution Steps

1. Clone the github code `git clone https://github.com/asreenath/terraform-aws-deepracer-cloud`
2. Use awscli to login to AWS , copy those credentials to `provider.tf` for access_key, secret_key and optionally token
3. Use terraform cli to login to Terraform using `terraform init` and follow the prompts to setup the terraform cli tp use your required organizaiton
3. Update the model files in `custom_files` directory
4. Update the `.tfvars` (ex:- local.tfvars) with appropriate inputs
5. Update the terraform 
6. Run `terraform plan --var-file=local.tfvars` to verify the changes to your infrastructure using appropriate environment file (ex:- local.tfvars)
7. Run `terraform apply --var-file=local.tfvars` to apply the changes to your infrastructure using appropriate environment file (ex:- local.tfvars)
8. Note the outputs to refer to your training/evaluation artifacts

# Operations

## New Run
1. To run multiple parallel runs that may use different different model inputs (hyperparameters/reward function etc) , the easiest way is to use multiple terraform workspaces, and use the `Execution Steps` mentioned above. Do not forget to create a separate `.tfvars` file for that run
2. IMPORTANT inputs to modify in `.tfvars` file are `bucket_name_prefix`, `dr_world_name`, `dr_model_base_name` and `ssm_parameter_name_prefix`
3. IMPORTANT to update your `custom_files` directory as required for the new run

## Shut Down EC2 instance
1. Run `terraform apply --var-file=local.tfvars --desired=0` to set the AutoScalingGroup desired capacity value to zero

## Tear down infrastructure
1. Run `terraform destroy --var-file=local.tfvars` to apply the changes to your infrastructure using appropriate environment file (ex:- local.tfvars)

# Known Issues

1. Terraform unable to assume a role to connect to AWS either with profile or not
2. Terraform unable to use AWS credentials file