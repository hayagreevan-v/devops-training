# Assignment 2: Internet-Facing ALB with Private Web Servers
## Topics

**Terraform Remote State & Backend**
- Remote Backends
- State Lockings
- Backend using S3 in AWS

**Terraform Hands-on**	
- Hands-on terraform code using basics
- Code Review
- Understanding best practices


## Objective:
Use Terraform to provision an AWS environment where two web servers run in private subnets and are accessible via an internet-facing Application Load Balancer (ALB) in public subnets.

## Requirements:
- Implement remote backend and state locking using AWS S3
- Create a VPC with public and private subnets across two Availability Zones.
- Launch 2 EC2 instances (web servers) in private subnets with no public IPs.
- Create an internet-facing ALB in public subnets that routes HTTP traffic to the web servers.
- Configure security groups:
     - ALB: allow HTTP (port 80) from anywhere.
     - Web servers: allow HTTP only from the ALB’s security group.
     - Ensure private instances can access the internet via a NAT Gateway.
- Output ALB DNS name, instance IDs, and subnet IDs.

### To Run

``` bash
terraform init
terraform plan
terraform apply
```

## Extras
- how to connect private instance to internet without nat through endpoints
- alb https integrations
- alb doesn't need egress
- state locking


- loops
- workspace

- `terraform fmt -recursive` - prettier

## Links
- https://developer.hashicorp.com/terraform/language/backend
- https://developer.hashicorp.com/terraform/language/backend/s3
- https://www.terraform-best-practices.com/
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment