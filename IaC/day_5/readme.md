**AWS CDK TASK:**
- Create a VPC with 3 public and 3 private subnets across 3 AZs.
- Public subnets with internet gateway, private subnets with NAT gateway.
- Launch EC2 Instances with nginx application running.
- Deploy an ALB in public subnets (HTTP) with the target as EC2 instances.
- Set up an S3 bucket for frontend files.(use a sample index.html)
- Deploy CloudFront Distribution in front of S3, using OAC and restrict S3 bucket access to CloudFront only

**Learning Docs Link:**
- https://docs.aws.amazon.com/cdk/v2/guide/home.html ,
- https://docs.aws.amazon.com/cdk/v2/guide/hello-world.html,
- https://docs.aws.amazon.com/cdk/v2/guide/stacks.html,
- https://docs.aws.amazon.com/cdk/v2/guide/constructs.html,
- https://docs.aws.amazon.com/cdk/v2/guide/best-practices.html
- https://docs.aws.amazon.com/cdk/v2/guide/stack-how-to-create-multiple-stacks.html