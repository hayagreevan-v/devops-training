# Day 1 Task

## Assignment 1: Basic Web Server Deployment on AWS
 
### Objective:
**Use Terraform to automate the creation of a simple web server on AWS within a custom network environment.**
 
### Requirements:
- Create a VPC with a public subnet.l;
- Launch an EC2 instance in that subnet to host a basic web server (e.g., Apache).
- Create a security group that allows inbound HTTP (port 80) access.
- Use user data to automatically install and start the web server.
- Output the public IP or DNS of the instance

----

### To Run
``` bash
terraform init
terraform plan
terraform apply
```

## Best Practices and Extra Notes

**Outputs (Purpose)**
- descriptions
- workspaces
- module’s inputs

**Files segregation**
- variables 
- outputs 
- networking
- webserver
- input
- provider

**Name conventions**
- give a meaningful logical names
- use main.tf for main file

**Fix outputs** - Done

**Try user data file and pass it as the variable** - Done

**Variablize repeatable content** - Done

**Analyse what is the best way to pass the variables to tf files / how to store variables separately**

**Play with terraform state!!**

**What are all places to store state files**

**Try creating key pair**  - Done

**Readme.md**
- description
- how to run the service



## Links
- https://spacelift.io/blog/how-to-use-terraform-variables#terraform-variables-best-practices
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/
- https://chatgpt.com/c/68ffcd3c-7b5c-8324-a663-495204b39efb
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html
