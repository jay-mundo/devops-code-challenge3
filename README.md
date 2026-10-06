# AWS DevOps Code Challenge 3
## Infrastructure as Code with Terraform and Ansible

> Provisioning AWS infrastructure with Terraform, configuring an EC2 web server with Ansible, and deploying a simple Hello World webpage with Nginx.

---

## Table of Contents

- [Project Overview](#project-overview)
- [60-Second Summary](#60-second-summary)
- [What Is Cloud Engineering?](#what-is-cloud-engineering)
- [Challenge Requirements](#challenge-requirements)
- [Application](#application)
- [Architecture](#architecture)
- [How the Application Works](#how-the-application-works)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Terraform](#terraform)
- [Terraform Workflow](#terraform-workflow)
- [Terraform State and Lock File](#terraform-state-and-lock-file)
- [AWS Networking](#aws-networking)
- [VPC](#vpc)
- [Public Subnet](#public-subnet)
- [Internet Gateway](#internet-gateway)
- [Route Table](#route-table)
- [Security Group](#security-group)
- [IAM Role](#iam-role)
- [S3](#s3)
- [EC2](#ec2)
- [SSH Access](#ssh-access)
- [Ansible](#ansible)
- [Ansible Inventory](#ansible-inventory)
- [Ansible Playbook](#ansible-playbook)
- [Nginx](#nginx)
- [Terraform vs Ansible](#terraform-vs-ansible)
- [End-to-End Deployment](#end-to-end-deployment)
- [Security Practices](#security-practices)
- [Troubleshooting Lessons](#troubleshooting-lessons)
- [Verification](#verification)
- [Command Cheat Sheet](#command-cheat-sheet)
- [AWS Costs](#aws-costs)
- [Resources Not Used](#resources-not-used)
- [Cleanup](#cleanup)
- [Interview Explanation](#interview-explanation)
- [Skills Demonstrated](#skills-demonstrated)
- [Architecture Summary](#architecture-summary)
- [Final Deliverables](#final-deliverables)
- [Current Deployment](#current-deployment)
- [Final Takeaway](#final-takeaway)
- [Project Status](#project-status)

---

# Project Overview

This project demonstrates how to provision and configure a complete AWS web server environment using **Infrastructure as Code (IaC)** and configuration management.

The infrastructure is created using **Terraform**, while the EC2 server configuration and web application deployment are handled using **Ansible**.

The final result is a publicly accessible EC2 web server running Nginx and serving a simple Hello World webpage.

The project demonstrates the complete workflow:

```text
Terraform
   ↓
Create AWS infrastructure
   ↓
Create VPC / Subnet / Internet Gateway
   ↓
Create Security Group
   ↓
Create IAM Role
   ↓
Create S3 Bucket
   ↓
Create EC2 Instance
   ↓
SSH connection
   ↓
Ansible
   ↓
Install and configure Nginx
   ↓
Deploy index.html
   ↓
Public webpage

60-Second Summary
This project uses Terraform to build AWS infrastructure and Ansible to configure the EC2 server.
Terraform creates:
- VPC
- Public subnet
- Internet Gateway
- Route table
- Security Group
- IAM role
- IAM instance profile
- S3 bucket
- EC2 instance
After the EC2 instance is created, Ansible connects to it over SSH and:
1. Updates the package cache
2. Installs Nginx
3. Starts Nginx
4. Enables Nginx to start automatically
5. Deploys a Hello World HTML page
The final webpage is accessible through the EC2 instance's public IP address.
What Is Cloud Engineering?
Cloud engineering is essentially building and managing technology infrastructure using cloud platforms such as AWS.
Instead of physically purchasing servers, networking equipment, storage devices, and firewalls, cloud engineers can create those resources using cloud services.
For example:
Traditional Data Center

Physical Server
      ↓
Physical Network
      ↓
Physical Firewall
      ↓
Physical Storage

With AWS:
AWS
 ├── EC2       → Virtual Server
 ├── VPC       → Network
 ├── Subnet    → Network Segment
 ├── SG        → Firewall
 ├── S3        → Object Storage
 └── IAM       → Permissions / Identity

Terraform allows these AWS resources to be created using code instead of manually clicking through the AWS Console.
Challenge Requirements
The challenge required building a simple AWS environment using Infrastructure as Code and configuration management.
The major requirements were:
- Use Terraform
- Provision AWS infrastructure
- Create an EC2 instance
- Create an S3 bucket
- Create IAM resources
- Configure networking
- Configure security groups
- Use Ansible to configure the EC2 server
- Install and configure Nginx or Apache
- Deploy a simple Hello World webpage
- Document the entire process
- Provide the GitHub repository
- Provide the webpage URL
Application
The application for this challenge is intentionally simple.
The webpage contains:
Hello, World!

Deployed with Terraform and Ansible.

The HTML file is deployed to:
/var/www/html/index.html

Nginx serves the file to anyone accessing the EC2 server over HTTP.
Architecture
The final architecture is:
                         INTERNET
                             |
                             |
                         HTTP :80
                             |
                             v
                  +----------------------+
                  |      AWS VPC         |
                  |    10.0.0.0/16       |
                  |                      |
                  |  Public Subnet       |
                  |  10.0.1.0/24         |
                  |                      |
                  |   +--------------+   |
                  |   |     EC2      |   |
                  |   | Ubuntu 24.04 |   |
                  |   |              |   |
                  |   |    Nginx     |   |
                  |   |      |       |   |
                  |   | index.html   |   |
                  |   +--------------+   |
                  |          |           |
                  +----------|-----------+
                             |
                       Internet Gateway
                             |
                             v
                          INTERNET

Terraform creates the infrastructure.
Ansible configures the EC2 instance.
Nginx serves the webpage.
How the Application Works
When a user visits the EC2 public IP:
Browser
   |
   | HTTP request
   | Port 80
   v
AWS Internet Gateway
   |
   v
VPC
   |
   v
Public Subnet
   |
   v
Security Group
   |
   | Allows TCP/80
   v
EC2 Instance
   |
   v
Nginx
   |
   v
/var/www/html/index.html
   |
   v
Hello, World!

The Security Group allows HTTP traffic from the internet.
Nginx receives the request and returns the HTML page.
Technologies Used
AWS
- Amazon EC2
- Amazon VPC
- Amazon S3
- AWS IAM
- Internet Gateway
- Route Tables
- Security Groups
Infrastructure as Code
- Terraform
Configuration Management
- Ansible
Web Server
- Nginx
Operating System
- Ubuntu 24.04 LTS ARM64
Programming / Markup
- HTML
Source Control
- Git
- GitHub
Local Environment
- macOS
- Apple Silicon
Project Structure
devops-code-challenge3/
│
├── .git/
│
├── .gitignore
│
├── README.md
│
├── ansible/
│   ├── inventory.ini
│   └── playbook.yml
│
└── terraform/
    ├── .terraform.lock.hcl
    ├── ec2.tf
    ├── iam.tf
    ├── internet_gateway.tf
    ├── outputs.tf
    ├── provider.tf
    ├── route_table.tf
    ├── s3.tf
    ├── security_group.tf
    ├── subnet.tf
    └── vpc.tf

Prerequisites
The following tools were used for this project:
- AWS account
- AWS CLI
- Terraform
- Ansible
- Git
- GitHub
- SSH key pair
- macOS terminal
- VS Code
The AWS CLI was configured for:
Region: us-east-1

Terraform version:
Terraform v1.15.8

Ansible version:
Ansible Core 2.21.4

Python:
Python 3.14.7

Terraform
Terraform is the Infrastructure as Code tool used to create the AWS environment.
Instead of manually creating every AWS resource through the AWS Console, the infrastructure is defined using .tf files.
For example:
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "devops-code-challenge3-vpc"
  }
}

Terraform reads the configuration and determines what AWS resources need to exist.
Terraform Workflow
The general Terraform workflow is:
terraform init
        ↓
terraform validate
        ↓
terraform plan
        ↓
terraform apply
        ↓
AWS infrastructure created

1. Initialize Terraform
cd ~/devops-code-challenge3/terraform

terraform init

This downloads the required provider plugins.
This project uses the AWS provider.
2. Validate Configuration
terraform validate

This checks whether the Terraform configuration is syntactically valid and internally consistent.
Successful validation:
Success! The configuration is valid.

3. Create an Execution Plan
terraform plan

Terraform compares:
Desired Configuration
        +
Current Terraform State
        ↓
Required Changes

For example:
Plan: 10 to add, 0 to change, 0 to destroy.

4. Apply the Configuration
terraform apply

Terraform then creates the AWS resources.
The final deployment initially reported:
Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

5. Verify the Infrastructure
terraform plan

After everything is properly deployed, Terraform should report:
No changes. Your infrastructure matches the configuration.

This means the actual AWS environment matches the Terraform configuration.
Terraform State and Lock File
Terraform maintains information about the infrastructure it manages.
The important files are:
terraform.tfstate
.terraform.lock.hcl

The state file tracks resources Terraform created and their IDs.
For example, Terraform can use state to know:
VPC ID
Subnet ID
EC2 Instance ID
Security Group ID
S3 Bucket
IAM Role

The .terraform.lock.hcl file locks provider versions so Terraform can consistently use the expected provider versions.
The project intentionally ignores Terraform state files in Git because state files can contain sensitive infrastructure information.
AWS Networking
Networking is one of the most important parts of this project.
The network was built using:
VPC
 |
 +-- Public Subnet
 |
 +-- Internet Gateway
 |
 +-- Route Table
 |
 +-- EC2

VPC
The VPC provides the private AWS network boundary.
Configuration:
CIDR: 10.0.0.0/16

Terraform:
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "devops-code-challenge3-vpc"
  }
}

Think of the VPC as the overall neighborhood where the AWS resources live.
Public Subnet
The EC2 instance is located inside a public subnet.
Subnet:
10.0.1.0/24

Availability Zone:
us-east-1a

Terraform:
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "devops-code-challenge3-public-subnet"
  }
}

The subnet is considered public because its route table sends internet traffic through the Internet Gateway.
Internet Gateway
The Internet Gateway allows communication between the VPC and the public internet.
Terraform:
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "devops-code-challenge3-igw"
  }
}

Think of the Internet Gateway as the doorway between the AWS VPC and the internet.
Route Table
The public route table contains:
0.0.0.0/0 → Internet Gateway

This means:
If traffic is going anywhere outside the VPC, send it through the Internet Gateway.

Terraform:
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "devops-code-challenge3-public-route-table"
  }
}

The subnet is then associated with the route table:
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

Security Group
The Security Group acts as the firewall for the EC2 instance.
The configuration allows:
SSH
Port 22
Source: Administrator's public IP only

HTTP
Port 80
Source: Anywhere

Outbound traffic is allowed.
Terraform:
resource "aws_security_group" "ec2" {
  name        = "devops-code-challenge3-ec2-sg"
  description = "Security group for Challenge 3 EC2 instance"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from administrator"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.admin_cidr]
  }

  ingress {
    description = "HTTP from the internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "devops-code-challenge3-ec2-sg"
  }
}

The SSH source is restricted to the administrator's public IP.
This is safer than:
0.0.0.0/0

for SSH.
IAM Role
An IAM role was created for the EC2 instance.
The role allows EC2 to assume the role.
Terraform:
resource "aws_iam_role" "ec2" {
  name = "devops-code-challenge3-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "devops-code-challenge3-ec2-role"
  }
}

An instance profile connects the IAM role to the EC2 instance:
resource "aws_iam_instance_profile" "ec2" {
  name = "devops-code-challenge3-ec2-profile"
  role = aws_iam_role.ec2.name
}

Important
This project does not attach an AWS permissions policy to the role.
Therefore, the project does not claim that the EC2 instance has permission to access S3.
The IAM role demonstrates how an EC2 instance can be associated with an IAM identity without unnecessarily granting permissions that the application does not need.
S3
An S3 bucket was created using Terraform.
Terraform:
resource "aws_s3_bucket" "challenge" {
  bucket_prefix = "devops-code-challenge3-"

  tags = {
    Name = "devops-code-challenge3-bucket"
  }
}

Because S3 bucket names must be globally unique, Terraform generates a unique suffix using:
bucket_prefix

The resulting bucket was:
devops-code-challenge3-d1719b880fece883cc759a7724

The S3 bucket is part of the infrastructure requirements.
It is not being used to host the webpage.
The webpage is hosted directly on the EC2 instance using Nginx.
EC2
The EC2 instance is the actual web server.
The project uses:
Instance Type: t4g.micro
Operating System: Ubuntu 24.04 LTS
Architecture: ARM64

Terraform dynamically retrieves the latest matching Ubuntu ARM64 AMI:
data "aws_ami" "ubuntu" {
  most_recent = true

  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["arm64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

The EC2 instance:
resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t4g.micro"

  key_name = "jaymundo"

  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids     = [aws_security_group.ec2.id]
  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2.name

  tags = {
    Name = "devops-code-challenge3-web-server"
  }
}

SSH Access
SSH is used by Ansible to connect to the EC2 instance.
The EC2 instance uses the key pair:
jaymundo

The private key is stored locally:
~/.ssh/jaymundo.pem

The private key is intentionally excluded from Git using .gitignore.
SSH access:
ssh -i ~/.ssh/jaymundo.pem ubuntu@<EC2_PUBLIC_IP>

For example:
ssh -i ~/.ssh/jaymundo.pem ubuntu@100.61.115.64

Once connected:
ubuntu@ip-10-0-1-xxx

The server can then be managed remotely.
Ansible
Ansible is used after Terraform finishes creating the EC2 instance.
This is an important distinction:
Terraform
    ↓
Creates the server

Ansible
    ↓
Configures the server

Terraform is responsible for infrastructure.
Ansible is responsible for configuration.
Ansible Inventory
The inventory tells Ansible which machines it should manage.
File:
ansible/inventory.ini

Contents:
[web]
<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/jaymundo.pem

Example:
[web]
100.61.115.64 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/jaymundo.pem

The inventory tells Ansible:
Server:
100.61.115.64

User:
ubuntu

SSH key:
~/.ssh/jaymundo.pem

Testing Ansible Connectivity
Before running the playbook, connectivity was tested using:
ansible -i inventory.ini web -m ping

Successful result:
100.61.115.64 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false,
    "ping": "pong"
}

The pong response confirms that Ansible successfully connected to the EC2 server.
The Python interpreter discovery message is informational and does not indicate a failure.
Ansible Playbook
The playbook is located at:
ansible/playbook.yml

Complete playbook:
---
- name: Configure web server
  hosts: web
  become: true

  tasks:
    - name: Update apt package cache
      ansible.builtin.apt:
        update_cache: true
        cache_valid_time: 3600

    - name: Install Nginx
      ansible.builtin.apt:
        name: nginx
        state: present

    - name: Ensure Nginx is running
      ansible.builtin.service:
        name: nginx
        state: started
        enabled: true

    - name: Deploy Hello World webpage
      ansible.builtin.copy:
        content: |
          <!DOCTYPE html>
          <html>
          <head>
            <title>DevOps Challenge 3</title>
          </head>
          <body>
            <h1>Hello, World!</h1>
            <p>Deployed with Terraform and Ansible.</p>
          </body>
          </html>
        dest: /var/www/html/index.html
        owner: root
        group: root
        mode: "0644"

What the Ansible Playbook Does
Task 1 — Update Package Cache
- name: Update apt package cache

This makes sure Ubuntu has current package information before installing software.
Task 2 — Install Nginx
- name: Install Nginx

Ansible installs:
nginx

The configuration:
state: present

means:
Make sure Nginx is installed.

Task 3 — Start Nginx
- name: Ensure Nginx is running

This makes sure the service is running.
It also enables Nginx to start automatically when the server boots.
Task 4 — Deploy Website
Ansible creates:
/var/www/html/index.html

The file contains:
<h1>Hello, World!</h1>
<p>Deployed with Terraform and Ansible.</p>

Ansible Idempotence
One important Ansible concept demonstrated by this project is idempotence.
Idempotence means:
Running the same configuration multiple times should not continuously change the server if the server is already in the desired state.

For example:
state: present

does not reinstall Nginx every time.
If Nginx is already installed, Ansible recognizes that the desired state already exists.
This is one of the reasons configuration management tools are useful.
Nginx
Nginx is the web server used for this challenge.
It listens for HTTP requests on:
Port 80

The website is stored at:
/var/www/html/index.html

The flow is:
Browser
   ↓
HTTP Port 80
   ↓
EC2 Security Group
   ↓
Nginx
   ↓
/var/www/html/index.html
   ↓
HTML Response

Terraform vs Ansible
One of the most important concepts learned from this project is understanding the difference between Terraform and Ansible.
Terraform
Terraform answers:
"What infrastructure should exist?"

Examples:
VPC
Subnet
EC2
S3
Security Group
IAM Role
Internet Gateway
Route Table

Ansible
Ansible answers:
"How should the server be configured?"

Examples:
Install Nginx
Start Nginx
Enable Nginx
Deploy HTML
Configure software

Simple Analogy
Think about building a house.
Terraform:
Build the house
Build the driveway
Install the electrical system
Build the rooms

Ansible:
Put furniture inside
Install software
Configure appliances
Set up the rooms

Terraform creates the infrastructure.
Ansible configures what runs inside the infrastructure.
End-to-End Deployment
The complete deployment process was:
Step 1 — Build Terraform Configuration
Terraform files were created for:
VPC
Subnet
Internet Gateway
Route Table
Security Group
IAM
S3
EC2
Outputs
Provider

Step 2 — Initialize Terraform
terraform init

Step 3 — Validate Terraform
terraform validate

Result:
Success! The configuration is valid.

Step 4 — Review Terraform Plan
terraform plan

Initial plan:
Plan: 10 to add, 0 to change, 0 to destroy.

Step 5 — Create Infrastructure
terraform apply

Terraform created the AWS environment.
Step 6 — Configure SSH Key
The EC2 resource uses:
key_name = "jaymundo"

Adding this setting caused Terraform to replace the original EC2 instance because the existing instance needed to be recreated with the correct key pair.
This resulted in a new:
Instance ID
Public IP
Public DNS

The replacement EC2 instance became:
i-0ba493df955aa9829

The new public IP became:
100.61.115.64

Step 7 — Verify Terraform
Running:
terraform plan

after the infrastructure was configured resulted in:
No changes. Your infrastructure matches the configuration.

This confirmed that Terraform and AWS were synchronized.
Step 8 — Test SSH
ssh -i ~/.ssh/jaymundo.pem ubuntu@100.61.115.64

SSH successfully connected to Ubuntu.
Step 9 — Test Ansible
ansible -i inventory.ini web -m ping

Result:
pong

This confirmed that Ansible could reach the server.
Step 10 — Run Ansible Playbook
ansible-playbook -i inventory.ini playbook.yml

Successful result:
PLAY RECAP
100.61.115.64 : ok=5 changed=3 unreachable=0 failed=0 skipped=0 rescued=0 ignored=0

The important part is:
failed=0

The configuration completed successfully.
Step 11 — Open the Website
The webpage was then accessible at:
http://100.61.115.64

The page displays:
Hello, World!

Deployed with Terraform and Ansible.

Security Practices
Several security practices were implemented.
SSH Restricted by IP
SSH access is not open to everyone.
Port 22 only allows the administrator's public IP:
<ADMIN_PUBLIC_IP>/32

This reduces unnecessary exposure.
HTTP Publicly Accessible
Port 80 is intentionally open:
0.0.0.0/0

This is necessary because the challenge requires the webpage to be publicly accessible.
Private SSH Key Excluded from Git
The .gitignore file contains:
*.pem
*.key

This prevents private keys from accidentally being committed to GitHub.
Terraform State Excluded from Git
The .gitignore file contains:
*.tfstate
*.tfstate.*

Terraform state should not be casually committed to a public repository.
No Unnecessary IAM Permissions
The EC2 IAM role does not have unnecessary AWS permissions attached.
The project follows the principle of:
Give resources only the permissions they actually need.

Troubleshooting Lessons
EC2 Key Pair Replacement
One important Terraform lesson occurred when:
key_name = "jaymundo"

was added to the EC2 configuration.
Terraform determined that the existing EC2 instance could not simply be modified and needed to be replaced.
Terraform reported:
Plan: 1 to add, 0 to change, 1 to destroy.

This resulted in a new EC2 instance and therefore a new public IP.
This demonstrated an important Terraform concept:
Some infrastructure changes require resource replacement instead of an in-place update.

Terraform Drift / No Changes
After the infrastructure was finalized:
terraform plan

returned:
No changes. Your infrastructure matches the configuration.

This is a good sign.
It means:
Terraform configuration
        =
Terraform state
        =
AWS infrastructure

Ansible Connectivity Troubleshooting
Before running the Ansible playbook, connectivity was tested with:
ansible -i inventory.ini web -m ping

This is useful because it separates:
SSH / Connectivity Problems

from:
Playbook / Configuration Problems

If ping fails, the issue is probably related to:
- Security Group
- Public IP
- SSH key
- Username
- Network connectivity
- SSH configuration
If ping succeeds but the playbook fails, the issue is more likely inside the Ansible configuration.
Verification
Verify Terraform
cd ~/devops-code-challenge3/terraform

terraform plan

Expected:
No changes. Your infrastructure matches the configuration.

Verify EC2
terraform output ec2_public_ip

Expected current IP:
100.61.115.64

Verify Public DNS
terraform output ec2_public_dns

Current DNS:
ec2-100-61-115-64.compute-1.amazonaws.com

Verify Ansible Connectivity
cd ~/devops-code-challenge3/ansible

ansible -i inventory.ini web -m ping

Expected:
pong

Verify Nginx
SSH into the instance:
ssh -i ~/.ssh/jaymundo.pem ubuntu@100.61.115.64

Then:
systemctl status nginx

Nginx should show as active/running.
Verify Webpage
Open:
http://100.61.115.64

Expected:
Hello, World!

Deployed with Terraform and Ansible.

Command Cheat Sheet
Terraform
Initialize:
terraform init

Validate:
terraform validate

Format:
terraform fmt

Plan:
terraform plan

Apply:
terraform apply

Show outputs:
terraform output

Show a specific output:
terraform output ec2_public_ip

Destroy:
terraform destroy

Ansible
Test connectivity:
ansible -i inventory.ini web -m ping

Run playbook:
ansible-playbook -i inventory.ini playbook.yml

Run with verbose output:
ansible-playbook -i inventory.ini playbook.yml -v

SSH
Connect to EC2:
ssh -i ~/.ssh/jaymundo.pem ubuntu@<EC2_PUBLIC_IP>

Git
Check status:
git status

Add README:
git add README.md

Commit:
git commit -m "Expand Challenge 3 documentation"

Push:
git push

AWS Costs
AWS resources can generate charges depending on usage, account status, region, and current AWS pricing.
The primary resources in this project that can potentially incur charges include:
EC2
The project uses:
t4g.micro

EC2 instances are billed based on usage.
EBS
The EC2 instance has root storage attached.
EBS storage can incur charges depending on the volume type and amount of storage allocated.
Public IPv4
AWS may charge for public IPv4 addresses.
The EC2 instance uses a public IPv4 address so that:
- SSH can reach the server
- The public webpage can be accessed
S3
The S3 bucket can potentially incur charges depending on:
- Storage
- Requests
- Data transfer
The bucket currently contains no application hosting workload.
Data Transfer
AWS data transfer charges can apply depending on how resources are used and how much traffic they receive.
Resources Not Used
This project intentionally does not use several AWS services that were used in other projects.
Those services include:
EKS
ECS
Fargate
Kubernetes
Jenkins
GitHub Actions
ALB
NAT Gateway
RDS
CloudFront
Docker

They are not required for this challenge.
Keeping the architecture simple reduces unnecessary complexity and cost.
Cleanup
When the challenge has been reviewed and submitted, the infrastructure can be removed with:
cd ~/devops-code-challenge3/terraform

terraform destroy

Terraform will display the resources it plans to remove.
Review the plan carefully before confirming.
You will be asked to confirm:
Enter a value: yes

Only run terraform destroy after the project no longer needs to remain online for mentor review, grading, or submission.
Interview Explanation
A strong way to explain this project during an interview is:
"For this project, I used Terraform to provision AWS infrastructure including a VPC, public subnet, Internet Gateway, route table, Security Group, IAM role, S3 bucket, and an EC2 instance. Once the infrastructure was created, I used Ansible over SSH to configure the EC2 server, install and enable Nginx, and deploy a simple Hello World webpage. This project helped me demonstrate the separation between infrastructure provisioning with Terraform and server configuration with Ansible."

Explain Terraform Simply
If an interviewer asks:
"What is Terraform?"

A simple answer:
"Terraform is an Infrastructure as Code tool. Instead of manually creating AWS resources through the console, I define the infrastructure in configuration files and Terraform creates and manages those resources for me."

Explain Ansible Simply
If an interviewer asks:
"What is Ansible?"

Answer:
"Ansible is a configuration management and automation tool. In this project, I used it to connect to the EC2 instance over SSH, install Nginx, start the service, and deploy the HTML webpage."

Explain the Difference Between Terraform and Ansible
A simple interview answer:
"Terraform creates the infrastructure, while Ansible configures the infrastructure. Terraform created my VPC, subnet, security group, IAM resources, S3 bucket, and EC2 instance. Ansible then connected to that EC2 instance and installed and configured Nginx."

Explain the Network
If asked how the EC2 server became publicly accessible:
"The EC2 instance was placed in a public subnet inside a VPC. The subnet's route table has a default route through an Internet Gateway. The EC2 instance also has a public IP address, and its Security Group allows HTTP traffic on port 80. That allows users on the internet to reach Nginx."

Explain the Security Group
If asked about the firewall:
"The Security Group allows SSH on port 22 only from my administrator IP address and allows HTTP on port 80 from the internet. Outbound traffic is allowed. This provides public web access while restricting SSH access."

Explain the Deployment Flow
A simple explanation:
1. Terraform creates AWS infrastructure.

2. Terraform creates EC2.

3. EC2 receives a public IP.

4. SSH provides secure access to EC2.

5. Ansible connects to EC2.

6. Ansible installs Nginx.

7. Ansible starts Nginx.

8. Ansible deploys index.html.

9. Nginx serves the webpage.

10. Users access the webpage through HTTP.

Skills Demonstrated
This project demonstrates experience with:
AWS
- Amazon EC2
- Amazon VPC
- Public subnets
- Internet Gateway
- Route tables
- Security Groups
- IAM
- S3
- Public IPv4 networking
Infrastructure as Code
- Terraform
- Terraform providers
- Terraform resources
- Terraform data sources
- Terraform variables
- Terraform outputs
- Terraform state
- Terraform planning
- Terraform resource replacement
- Infrastructure validation
Configuration Management
- Ansible
- Ansible inventory
- Ansible modules
- Ansible playbooks
- SSH connectivity
- Privilege escalation
- Idempotent configuration
Linux
- Ubuntu
- SSH
- systemctl
- package management
- file permissions
- web server configuration
Web Infrastructure
- Nginx
- HTTP
- Port 80
- HTML
- /var/www/html
DevOps
- Infrastructure as Code
- Configuration management
- Automation
- Git
- GitHub
- Troubleshooting
- Infrastructure verification
Architecture Summary
The entire project can be summarized as:
                        USER
                         |
                         | HTTP :80
                         v
              +----------------------+
              |    Internet Gateway  |
              +----------+-----------+
                         |
                         v
              +----------------------+
              |        VPC            |
              |    10.0.0.0/16        |
              |                       |
              |  +----------------+  |
              |  | Public Subnet  |  |
              |  |  10.0.1.0/24   |  |
              |  |                |  |
              |  |  +----------+  |  |
              |  |  |   EC2    |  |  |
              |  |  | Ubuntu   |  |  |
              |  |  |          |  |  |
              |  |  |  Nginx   |  |  |
              |  |  +----------+  |  |
              |  +----------------+  |
              +----------------------+

Terraform
    |
    +---- Creates VPC
    +---- Creates subnet
    +---- Creates IGW
    +---- Creates route table
    +---- Creates Security Group
    +---- Creates IAM
    +---- Creates S3
    +---- Creates EC2

Ansible
    |
    +---- SSH to EC2
    +---- Install Nginx
    +---- Start Nginx
    +---- Enable Nginx
    +---- Deploy index.html

Final Deliverables
The completed project provides:
GitHub Repository
https://github.com/jay-mundo/devops-code-challenge3

Web Application
http://100.61.115.64

Infrastructure
Terraform-managed:
VPC
Public Subnet
Internet Gateway
Route Table
Security Group
IAM Role
IAM Instance Profile
S3 Bucket
EC2 Instance

Configuration
Ansible-managed:
Nginx
Nginx Service
Hello World HTML

Current Deployment
At the time of completion, the active EC2 instance is:
Instance ID:
i-0ba493df955aa9829

Public IP:
100.61.115.64

Public DNS:
ec2-100-61-115-64.compute-1.amazonaws.com

Webpage:
http://100.61.115.64

S3 bucket:
devops-code-challenge3-d1719b880fece883cc759a7724

EC2 instance type:
t4g.micro

Operating system:
Ubuntu 24.04 LTS ARM64

Web server:
Nginx

Final Takeaway
This project demonstrates a complete Infrastructure as Code and configuration management workflow.
Instead of manually building infrastructure and configuring a server through the AWS Console, the environment is reproducible through code.
Terraform handles:
Infrastructure

Ansible handles:
Server Configuration

Nginx handles:
Web Traffic

AWS provides:
Cloud Infrastructure

The complete workflow is:
Terraform
   ↓
AWS Infrastructure
   ↓
EC2
   ↓
SSH
   ↓
Ansible
   ↓
Nginx
   ↓
HTML
   ↓
Public Website

The most important lesson from this project is understanding the difference between building infrastructure and configuring infrastructure.
Terraform builds the environment.
Ansible configures the server.
Together, they create a repeatable DevOps deployment process.
Project Status
Completed
- [x] AWS provider configured
- [x] Terraform initialized
- [x] Terraform validated
- [x] VPC created
- [x] Public subnet created
- [x] Internet Gateway created
- [x] Route table created
- [x] Security Group created
- [x] IAM role created
- [x] IAM instance profile created
- [x] S3 bucket created
- [x] EC2 instance created
- [x] EC2 key pair configured
- [x] SSH access verified
- [x] Ansible inventory created
- [x] Ansible connectivity verified
- [x] Nginx installed
- [x] Nginx configured and started
- [x] Hello World webpage deployed
- [x] Public webpage verified
- [x] Terraform plan verified with no changes
- [x] GitHub repository created
- [x] Project committed to Git
- [x] Project pushed to GitHub
- [x] Documentation completed
Final Result
AWS Infrastructure
        ↓
Terraform
        ↓
EC2 Web Server
        ↓
Ansible
        ↓
Nginx
        ↓
Hello World Website

Challenge 3 successfully completed.