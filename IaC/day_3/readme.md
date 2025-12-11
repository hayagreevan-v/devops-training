| **Topics** | **Description** |
|-------------|-----------------|
 **Terraform Meta-Arguments** | Explore and understand the following arguments:<br>- `depends_on`<br>- `count`<br>- `for_each`<br>- `lifecycle`<br>- `provider` |
| **Terraform Provisioners** | - `local-exec`<br>- `remote-exec`<br>- `file`<br>- `null_resource` |
| **Terraform Modules** | - What are modules?<br>- Creating and using a module<br>- Using modules from registry |
| **Terraform Functions, Expressions, Workspaces** | Learn different kinds of functions in Terraform. Commonly used functions:<br>- `lookup`<br>- `try`<br>- `merge`<br>- `range`<br>- `toset`<br>- `file`<br><br>Learn different kinds of expressions in Terraform. Commonly used expressions:<br>- For Expressions<br>- Conditional Expressions<br>- Dynamic Blocks<br>- String Interpolation<br>- Directives<br>- Splat Expressions<br>- Version Constraints<br><br>**Workspaces** |
| **Terraform Import, Taint & Debugging** | - `import` command<br>- `taint` command<br>- `untaint` command<br>- `terraform logs` |


# Assignment 3: 2-Tier Application on AWS
 
## Objective:
Deploy a 2-tier web application using Terraform with modular design.
 
## Requirements:

**Networking:** Create VPC, public/private subnets, Internet Gateway, and Route Tables.  
**Database:** Launch an RDS instance (MySQL engine).  

**Compute Layer:**
- Use Launch Template with data block to fetch AMI.
- Use user_data  to pull app code from Git and pass DB credentials as variables.
- Configure Auto Scaling Group (ASG).
- **Load Balancer:** Attach Application Load Balancer (ALB) to ASG.
- Check the DB connectivity from the web server (ALB)

**Terraform Features:**
- Use Modules for reusability (VPC networking, RDS, ASG).
- Implement Dynamic blocks in Security Groups.
- Apply data sources, for_each, lookup(), and try() functions.

**TIP:** use template file for generating user data scripts.  
https://spacelift.io/blog/terraform-templates
 
## Bonus Task:
Manually create EC2 instances and import them into Terraform state.


## Links
- https://www.terraform-best-practices.com/
- https://developer.hashicorp.com/terraform/language/state
- https://developer.hashicorp.com/terraform/language/block/data
- https://developer.hashicorp.com/terraform/language/functions/templatefile
- https://github.com/hayagreevan-v/php-mysql-demo-web-server
- https://spacelift.io/blog/terraform-templates
- https://spacelift.io/blog/terraform-lookup
- https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks
- https://developer.hashicorp.com/terraform/language/state/purpose
- https://developer.hashicorp.com/terraform/language/modules/develop/structure
- https://developer.hashicorp.com/terraform/language/block/module#create-multiple-instances-of-module-resources