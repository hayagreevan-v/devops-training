# DevOps Training

AWS  
Automation on Terraform  
Viz  
ExxesIm  
Networking  


Dev + Ops + QA + Security  
Ownership Mindset  
CI, CD, IaC, Monitoring and Observability  

### Lifecycle
Plan - Code - Build - Test - Release - deploy - Operate - Monitor -

### DevOps Principles
1. Encourage Collaboration
2. Always Improve
3. Automation
4. The customer comes first
5. Failure is a good thing
6. Teamwork makes the dream work
7. End-to-End Responsibility is the way forward




Invoke-Command -Host 98.80.212.189 -UserName Administrator -ScriptBlock {Get-ComputerInfo}

## Linux New terms :
- Sticky bit
- Symlink 
- & - End of cmd to perform it in backend
- ufw
- nc
- telnet


## Powershell :
AWS MGN
1. Install MGN agent Using powershell 
2. Create a powershell scripta to get hostname and IP addres in text file 

Design ––> Discover - Define - Ideate - Prototype - Test



https://tldp.org/LDP/abs/html/index.html  
https://aaltoscicomp.github.io/linux-shell/  

https://overthewire.org/wargames/bandit/  


Bandit1 ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
bandit2 263JGJPfgU6LtdEvgfWU1XP5yac29mFx
Bandit3	MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
bandit4	2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
bandit5	4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw 

for dir in $PWD/*; do for file in "$dir/"* "$dir/".*; do if [[ ! -x "$file" && $(du -b "$file" | cut -f1 ) == 1033  ]]; then echo $(du -b "$file"); fi  done;  done;
1033 /home/bandit5/inhere/maybehere07/.file2

 bandit6	HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

find /var/lib -name "bandit7*"
  
bandit7	morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
Bandit8	dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc 
 

## Networking

No. Of host = (2^hostbit -2)

DHCP - Discover, Offer, Request, Acknowledge



## AWS


### IAM 
- Identity and Access Management
- Follows LPP Least Privilege Principle
- Users and Group Management
- Policy defines the permission of group or user
- IAM is global service

### SCIM 
### IAM Identity Center
### Cross Account Service Sharing

![alt text](<IAM Policies Structure.png>)
￼

## VPC

### VPC Creation 
- VPC
- Subnet
- Route Table
- Internet Gateway, NAT Gateway
- VPC Endpoints
- VPC Peering - One-One
- Transit Gateway - One-Many

VPC is attached with Route Table  
Subnet is attached with NACL  
Instance is attached with Security Group  

VPC Endpoint - internal connection to AWS Services without the need for Internet


### VPC Subnet

Min		/28 
Max		/16

AWS reserves 5 IP Addresses in each subnet (First 4 and last 1)
Eg. 10.0.0.0/24
	- 10.0.0.0 -  Network Address
	- 10.0.0.1 -  Reserved by AWS for VPC router
	- 10.0.0.2 -  Reserved by AWS for mapping to Amazon-provided DNS
	- 10.0.0.3 -  Reserved by AWS for future use
	- 10.0.0.255 -  Network Broadcast Address (AWS doesn’t support Broadcast in VPC)


### NAT Gateway in AWS
- AWS Managed
- Uses elastic IP
- Can’t be used by EC2 instance in same subnet


### NACL - Network Access Control List
NACL  -> subnet level, Security Group -> Instance Level
NACL is stateless, SG is stateful
One NACL per subnet

#### Ephemeral Ports
- Port that is opened from Client for the temproary period of time (port from which client sends request and waits until it receivers the response) Bcoz Clients won’t have exposed ports  
IANA & MS Windows : 49152 - 65535
Many Linux Kernel : 32678 - 60999


## Elastic Load balancer
- Classic LB (2009)(deprecated)
- Application LB (2016)
- Network LB (2017)
- Gateway LB (2020)

Application servers don’t see the client IP directly. Client IP, Port and Protocol is passed by ALB to application through headers X-Forwarded-For, X-Forwarded-Port, X-Forwarded-Proto


## RDS

### Read Replica
- Read-Only RDS Instances
- Read replicas are async replications
- Intra-Region (no cost), Inter-Region (network cost applies)

### Multi AZ - Disaster Recovery
- Sync replication
- Standby server
- Or Read replicas can also be setup as Multi AZ for Disaster Recovery


## S3
- Globally unique name
![alt text](<Amazon S3 - Replication (Notes).png>)


### S3 Replication
- Won’t automatically replicate existing objects, It requires batch replication once to replicate existing objects.
- Versioning is required
- Permanent delete are not replicated

## Route 53
- Alias A Record for AWS Services (Cost-effective and support main domain)
- Route 53 DNS support multiple IPs for single record

### Routing Policy
- Simple : Random - No health checks - Added in same record
- Weighted : Ratio is assigned - Health checks
- Latency-based : Redirect to resource that has least latency
- Failover : Primary (w HealthCheck) Mandatory, Secondary
- Geolocation : Location based ( for location based content / restriction based on location)
- Geo-proximity - shift traffic based on bias
- IP-based
- Multi-Value - Send upto 8 healthy records to client - client-side load balancing - health check 


## Health Checks
- Endpoint - 15 global health checkers (Threshold 3)
- Calculated Health Checks
- Private HostZone - CloudWatch Metric being monitored



## CloudFront
- S3 (private)
- Vpc origins (private subnet applications)
- Custom HTTP


## ECS - Elastic Container Service
- AWS  Fargate (Serverless) or EC2 Launch Type  
- EFS can be mounted

## SQS - Queue
- Decoupled
- Message Visibility Timeout - Invisible for other consumers for that time period
- For fifo, Naming shpould end with .fifo
- Delete letter queue

## SNS - Pub-sub model
- Message filtering
- Standard, FIFO


## CloudWatch - Slide 581

Insights
![alt text](<CloudWatch Insights and Operational Visibility.png>)

Cloudtrail only stores data for 90 days, to store more than that then, store it in S3