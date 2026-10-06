# 🚀 AWS DevOps Code Challenge 3
## Infrastructure as Code with Terraform & Ansible

> **Provision AWS infrastructure with Terraform, configure an EC2 web server with Ansible, and deploy a simple Hello World application using Nginx.**

---

## 🏆 Project Overview

This project demonstrates a complete **Infrastructure as Code (IaC)** and **configuration management** workflow using AWS, Terraform, and Ansible.

The goal was to build an AWS environment from scratch, provision the infrastructure using Terraform, configure the EC2 server using Ansible, and deploy a publicly accessible Hello World webpage using Nginx.

### 🔥 What I Built

```text
Terraform
    │
    ├── VPC
    ├── Public Subnet
    ├── Internet Gateway
    ├── Route Table
    ├── Security Group
    ├── IAM Role
    ├── IAM Instance Profile
    ├── S3 Bucket
    └── EC2 Instance
             │
             ▼
          SSH Access
             │
             ▼
          Ansible
             │
             ├── Install Nginx
             ├── Start Nginx
             ├── Enable Nginx
             └── Deploy index.html
                     │
                     ▼
                🌎 Public Webpage

🎯 Final Result
A publicly accessible AWS EC2 web server running Nginx and serving:
Hello, World!
Deployed with Terraform and Ansible.

📚 Table of Contents
- 🏆 Project Overview
- ⚡ 60-Second Summary
- ☁️ What Is Cloud Engineering?
- 📋 Challenge Requirements
- 🌐 Application
- 🏗️ Architecture
- 🔄 Application Request Flow
- 🧰 Technologies Used
- 📁 Project Structure
- ⚙️ Prerequisites
- 🏗️ Terraform
- 🔄 Terraform Workflow
- 🗃️ Terraform State & Lock File
- 🌐 AWS Networking
- 🖧 VPC
- 📡 Public Subnet
- 🌍 Internet Gateway
- 🛣️ Route Table
- 🛡️ Security Group
- 🔐 IAM Role
- 🪣 S3
- 💻 EC2
- 🔑 SSH Access
- 🤖 Ansible
- 📋 Ansible Inventory
- 📜 Ansible Playbook
- 🌐 Nginx
- ⚔️ Terraform vs Ansible
- 🚀 End-to-End Deployment
- 🔒 Security Practices
- 🧯 Troubleshooting Lessons
- ✅ Verification
- ⌨️ Command Cheat Sheet
- 💰 AWS Costs
- 🚫 Resources Not Used
- 🧹 Cleanup
- 🎤 Interview Explanation
- 💡 Skills Demonstrated
- 🏛️ Architecture Summary
- 📦 Final Deliverables
- 📍 Current Deployment
- 🎓 Final Takeaway
- ✅ Project Status
⚡ 60-Second Summary
This project uses Terraform to build AWS infrastructure and Ansible to configure the EC2 server.
Terraform Creates
Resource	Purpose
🖧 VPC	Private AWS network
📡 Public Subnet	Network segment for EC2
🌍 Internet Gateway	Internet connectivity
🛣️ Route Table	Controls network routing
🛡️ Security Group	EC2 firewall
🔐 IAM Role	EC2 identity
🔗 IAM Instance Profile	Attaches IAM role to EC2
🪣 S3 Bucket	Object storage
💻 EC2	Web server


Ansible Configures
1. Updates the Ubuntu package cache
2. Installs Nginx
3. Starts Nginx
4. Enables Nginx at boot
5. Deploys the Hello World HTML page
Final Flow
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
🌎 Public Website

☁️ What Is Cloud Engineering?
Cloud engineering is the process of building and managing technology infrastructure using cloud platforms such as AWS.
Instead of physically purchasing servers, networking equipment, storage, and firewalls, cloud engineers can create those resources using cloud services and automation.
Traditional Infrastructure
Physical Server
      ↓
Physical Network
      ↓
Physical Firewall
      ↓
Physical Storage

AWS Infrastructure
AWS
 ├── 💻 EC2       → Virtual Server
 ├── 🖧 VPC       → Network
 ├── 📡 Subnet    → Network Segment
 ├── 🛡️ SG        → Firewall
 ├── 🪣 S3        → Object Storage
 └── 🔐 IAM       → Identity & Permissions

Terraform allows these AWS resources to be created using code instead of manually clicking through the AWS Console.
📋 Challenge Requirements
The challenge required building a simple AWS environment using Infrastructure as Code and configuration management.
Requirements
- [x] Use Terraform
- [x] Provision AWS infrastructure
- [x] Create an EC2 instance
- [x] Create an S3 bucket
- [x] Create IAM resources
- [x] Configure networking
- [x] Configure Security Groups
- [x] Use Ansible
- [x] Configure the EC2 server
- [x] Install Nginx or Apache
- [x] Deploy a Hello World webpage
- [x] Document the project
- [x] Provide GitHub repository
- [x] Provide webpage URL
🌐 Application
The application is intentionally simple.
The webpage displays:
Hello, World!

Deployed with Terraform and Ansible.

The HTML file is deployed to:
/var/www/html/index.html

Nginx serves this file when users access the EC2 server over HTTP.
🏗️ Architecture
                              🌎 INTERNET
                                  │
                                  │ HTTP :80
                                  ▼
                     ┌────────────────────────┐
                     │   Internet Gateway     │
                     └────────────┬───────────┘
                                  │
                                  ▼
              ┌─────────────────────────────────────┐
              │             AWS VPC                 │
              │          10.0.0.0/16                │
              │                                     │
              │     ┌─────────────────────────┐     │
              │     │     Public Subnet       │     │
              │     │       10.0.1.0/24       │     │
              │     │                         │     │
              │     │   ┌─────────────────┐   │     │
              │     │   │      EC2        │   │     │
              │     │   │                 │   │     │
              │     │   │ Ubuntu 24.04    │   │     │
              │     │   │                 │   │     │
              │     │   │     Nginx       │   │     │
              │     │   │       │         │   │     │
              │     │   │ index.html      │   │     │
              │     │   └─────────────────┘   │     │
              │     │                         │     │
              │     └─────────────────────────┘     │
              │                                     │
              └─────────────────────────────────────┘

Infrastructure Management
                 TERRAFORM
                     │
                     ▼
          ┌──────────────────────┐
          │    AWS Infrastructure│
          └──────────┬───────────┘
                     │
                     ▼
                    EC2
                     │
                     │ SSH
                     ▼
                  ANSIBLE
                     │
          ┌──────────┼──────────┐
          ▼          ▼          ▼
       Install     Start      Deploy
       Nginx       Nginx      HTML
          │          │          │
          └──────────┼──────────┘
                     ▼
                  NGINX
                     │
                     ▼
                WEBPAGE 🌎

🔄 Application Request Flow
When someone visits the EC2 public IP:
Browser
   │
   │ HTTP Request
   │ Port 80
   ▼
Internet Gateway
   │
   ▼
VPC
   │
   ▼
Public Subnet
   │
   ▼
Security Group
   │
   │ Allows TCP/80
   ▼
EC2 Instance
   │
   ▼
Nginx
   │
   ▼
/var/www/html/index.html
   │
   ▼
Hello, World!

The Security Group allows HTTP traffic from the internet.
Nginx receives the request and returns the HTML page.
🧰 Technologies Used
☁️ AWS
- Amazon EC2
- Amazon VPC
- Amazon S3
- AWS IAM
- Internet Gateway
- Route Tables
- Security Groups
🏗️ Infrastructure as Code
- Terraform
🤖 Configuration Management
- Ansible
🌐 Web Server
- Nginx
🐧 Operating System
- Ubuntu 24.04 LTS ARM64
📝 Markup
- HTML
🔀 Source Control
- Git
- GitHub
💻 Local Environment
- macOS
- Apple Silicon
- VS Code
📁 Project Structure
devops-code-challenge3/
│
├── .git/
│
├── .gitignore
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

⚙️ Prerequisites
The following tools were used:
- AWS account
- AWS CLI
- Terraform
- Ansible
- Git
- GitHub
- SSH key pair
- macOS Terminal
- VS Code
Environment
Tool	Version
AWS Region	us-east-1
Terraform	v1.15.8
Ansible Core	2.21.4
Python	3.14.7
OS	macOS / Apple Silicon
EC2 OS	Ubuntu 24.04 LTS ARM64


🏗️ Terraform
Terraform is the Infrastructure as Code tool used to create the AWS environment.
Instead of manually creating AWS resources through the AWS Console, the infrastructure is defined in .tf files.
Example
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "devops-code-challenge3-vpc"
  }
}

Terraform reads the configuration and determines what AWS resources need to exist.
🔄 Terraform Workflow
The general Terraform workflow is:
terraform init
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
      ↓
AWS Infrastructure

1️⃣ Initialize Terraform
cd ~/devops-code-challenge3/terraform

terraform init

This downloads the required provider plugins.
2️⃣ Validate Configuration
terraform validate

Expected:
Success! The configuration is valid.

3️⃣ Create an Execution Plan
terraform plan

Terraform compares:
Desired Configuration
        +
Current Terraform State
        ↓
Required Changes

Initial deployment:
Plan: 10 to add, 0 to change, 0 to destroy.

4️⃣ Apply Configuration
terraform apply

Terraform creates the AWS infrastructure.
Initial deployment:
Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

5️⃣ Verify Infrastructure
terraform plan

Expected:
No changes. Your infrastructure matches the configuration.

This means the AWS infrastructure matches the Terraform configuration.
🗃️ Terraform State & Lock File
Terraform maintains information about the infrastructure it manages.
Important files:
terraform.tfstate
.terraform.lock.hcl

Terraform State
The state file tracks resources Terraform created and their IDs.
For example:
VPC ID
Subnet ID
EC2 Instance ID
Security Group ID
S3 Bucket
IAM Role

Terraform Lock File
.terraform.lock.hcl locks provider versions so Terraform can consistently use the expected provider version.
Git Security
Terraform state files are excluded from Git:
*.tfstate
*.tfstate.*

This is important because Terraform state can contain sensitive infrastructure information.
🌐 AWS Networking
The AWS network consists of:
VPC
 │
 ├── Public Subnet
 │
 ├── Internet Gateway
 │
 ├── Route Table
 │
 └── EC2

🖧 VPC
The VPC provides the private AWS network boundary.
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

Simple Explanation
Think of the VPC as the neighborhood where the AWS resources live.
📡 Public Subnet
The EC2 instance is located inside a public subnet.
CIDR: 10.0.1.0/24
Availability Zone: us-east-1a

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
🌍 Internet Gateway
The Internet Gateway provides communication between the VPC and the public internet.
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "devops-code-challenge3-igw"
  }
}

Simple Explanation
Think of the Internet Gateway as the doorway between the AWS network and the internet.
🛣️ Route Table
The public route table contains:
0.0.0.0/0 → Internet Gateway

This means:
Traffic going outside the VPC should be sent through the Internet Gateway.

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

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

🛡️ Security Group
The Security Group acts as the firewall for the EC2 instance.
Inbound Rules
Protocol	Port	Source	Purpose
TCP	22	Administrator IP	SSH
TCP	80	0.0.0.0/0	HTTP


Outbound
All outbound traffic is allowed.
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

🔐 Security Principle
SSH is restricted to the administrator's public IP rather than opening port 22 to the entire internet.
🔐 IAM Role
An IAM role was created for the EC2 instance.
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

An instance profile connects the role to EC2:
resource "aws_iam_instance_profile" "ec2" {
  name = "devops-code-challenge3-ec2-profile"
  role = aws_iam_role.ec2.name
}

⚠️ Important: No AWS permissions policy is attached to this role.

Therefore, the EC2 instance does not have permissions to access the S3 bucket.
This follows the principle of avoiding unnecessary permissions.
🪣 S3
An S3 bucket was created using Terraform.
resource "aws_s3_bucket" "challenge" {
  bucket_prefix = "devops-code-challenge3-"

  tags = {
    Name = "devops-code-challenge3-bucket"
  }
}

Because S3 bucket names must be globally unique, Terraform generates a unique suffix.
Bucket
devops-code-challenge3-d1719b880fece883cc759a7724

ℹ️ The S3 bucket is part of the infrastructure requirements. It is not being used to host the webpage.

The webpage is hosted directly on EC2 using Nginx.
💻 EC2
The EC2 instance is the web server.
Setting	Value
Instance Type	t4g.micro
OS	Ubuntu 24.04 LTS
Architecture	ARM64
Region	us-east-1
Key Pair	jaymundo


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

EC2:
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

🔑 SSH Access
SSH is used by Ansible to connect to EC2.
Key Pair
jaymundo

Private Key
~/.ssh/jaymundo.pem

The private key is excluded from Git using:
*.pem
*.key

Connect
ssh -i ~/.ssh/jaymundo.pem ubuntu@<EC2_PUBLIC_IP>

Example:
ssh -i ~/.ssh/jaymundo.pem ubuntu@100.61.115.64

🤖 Ansible
Ansible is used after Terraform creates the EC2 instance.
This is the key distinction:
Terraform
    ↓
Creates Infrastructure

Ansible
    ↓
Configures Infrastructure

Terraform manages the AWS environment.
Ansible manages the server configuration.
📋 Ansible Inventory
File:
ansible/inventory.ini

Contents:
[web]
<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/jaymundo.pem

Example:
[web]
100.61.115.64 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/jaymundo.pem

This tells Ansible:
Server: 100.61.115.64
User: ubuntu
SSH Key: ~/.ssh/jaymundo.pem

🧪 Test Ansible Connectivity
Before running the playbook:
ansible -i inventory.ini web -m ping

Successful result:
100.61.115.64 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.12"
    },
    "changed": false,
    "ping": "pong"
}

The pong confirms that Ansible successfully connected to EC2.
📜 Ansible Playbook
File:
ansible/playbook.yml

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

🧩 What the Ansible Playbook Does
1️⃣ Update Package Cache
update_cache: true

Makes sure Ubuntu has current package information.
2️⃣ Install Nginx
name: nginx
state: present

Means:
Make sure Nginx is installed.

3️⃣ Start Nginx
state: started

Ensures Nginx is running.
4️⃣ Enable Nginx
enabled: true

Ensures Nginx starts automatically after a reboot.
5️⃣ Deploy Website
Ansible creates:
/var/www/html/index.html

with:
<h1>Hello, World!</h1>
<p>Deployed with Terraform and Ansible.</p>

♻️ Ansible Idempotence
An important Ansible concept demonstrated by this project is idempotence.
Simple Definition
Running the same configuration multiple times should not continuously change the server if the desired state already exists.

For example:
state: present

doesn't reinstall Nginx every time.
If Nginx already exists, Ansible recognizes that the desired state has already been achieved.
🌐 Nginx
Nginx is the web server used for this challenge.
It listens on:
HTTP → Port 80

The website is stored at:
/var/www/html/index.html

Request Flow
Browser
   ↓
HTTP :80
   ↓
Security Group
   ↓
EC2
   ↓
Nginx
   ↓
index.html
   ↓
HTML Response

⚔️ Terraform vs Ansible
This is one of the most important concepts demonstrated by this project.
Terraform	Ansible
Infrastructure as Code	Configuration Management
Creates infrastructure	Configures infrastructure
Creates VPC	Installs software
Creates subnet	Starts services
Creates EC2	Deploys files
Creates Security Group	Configures server
Creates S3	Manages server state


Terraform asks:
"What infrastructure should exist?"

Ansible asks:
"How should that server be configured?"

🏠 Simple Analogy
Think about building a house.
Terraform
🏠 Build the house
🚗 Build the driveway
⚡ Install electrical infrastructure
🚪 Build rooms

Ansible
🛋️ Put furniture inside
💻 Install software
🔧 Configure appliances
📺 Set up the rooms

Simple Rule
Terraform builds the environment. Ansible configures the environment.

🚀 End-to-End Deployment
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

Step 3 — Validate
terraform validate

Expected:
Success! The configuration is valid.

Step 4 — Review Plan
terraform plan

Initial plan:
Plan: 10 to add, 0 to change, 0 to destroy.

Step 5 — Create Infrastructure
terraform apply

Terraform creates the AWS environment.
Step 6 — Configure EC2 SSH Key
The EC2 resource uses:
key_name = "jaymundo"

Adding this setting caused Terraform to replace the original EC2 instance because the existing instance needed to be recreated with the correct key pair.
Terraform reported:
Plan: 1 to add, 0 to change, 1 to destroy.

Replacement Instance
Instance ID:
i-0ba493df955aa9829

Public IP:
100.61.115.64

This demonstrated an important Terraform concept:
Some infrastructure changes require resource replacement rather than an in-place update.

Step 7 — Verify Terraform
terraform plan

Result:
No changes. Your infrastructure matches the configuration.

This confirmed that Terraform and AWS were synchronized.
Step 8 — Test SSH
ssh -i ~/.ssh/jaymundo.pem ubuntu@100.61.115.64

SSH successfully connected to Ubuntu.
Step 9 — Test Ansible
ansible -i inventory.ini web -m ping

Result:
pong

Step 🔟 — Run Ansible
ansible-playbook -i inventory.ini playbook.yml

Successful result:
PLAY RECAP

100.61.115.64 :
ok=5
changed=3
unreachable=0
failed=0
skipped=0
rescued=0
ignored=0

Most Important Result
failed=0

The configuration completed successfully.
Step 1️⃣1️⃣ — Open Website
http://100.61.115.64

The page displays:
Hello, World!

Deployed with Terraform and Ansible.

🔒 Security Practices
🔐 SSH Restricted by IP
Port 22 is restricted to the administrator's public IP:
<ADMIN_PUBLIC_IP>/32

This is safer than:
0.0.0.0/0

🌎 HTTP Publicly Accessible
Port 80 is intentionally open:
0.0.0.0/0

This is required because the webpage must be publicly accessible.
🔑 Private SSH Key Excluded
.gitignore includes:
*.pem
*.key

This prevents private keys from being accidentally committed.
🗃️ Terraform State Excluded
.gitignore includes:
*.tfstate
*.tfstate.*

Terraform state should not be casually committed to GitHub.
🔐 Least Privilege
The EC2 IAM role has no attached permissions policy.
The project avoids granting AWS permissions that are not required.
🧯 Troubleshooting Lessons
EC2 Key Pair Replacement
Adding:
key_name = "jaymundo"

caused Terraform to replace the EC2 instance.
Terraform reported:
Plan: 1 to add, 0 to change, 1 to destroy.

This demonstrated that some Terraform resource attributes require replacement.
🔄 Terraform "No Changes"
After the infrastructure was finalized:
terraform plan

returned:
No changes. Your infrastructure matches the configuration.

This means:
Terraform Configuration
        =
Terraform State
        =
AWS Infrastructure

🧪 Ansible Connectivity Troubleshooting
Running:
ansible -i inventory.ini web -m ping

before the playbook helps separate connectivity problems from configuration problems.
If Ping Fails
Potential causes:
- Security Group
- Public IP
- SSH key
- Username
- Network connectivity
- SSH configuration
If Ping Succeeds
But the playbook fails, the problem is more likely within the Ansible configuration.
✅ Verification
Terraform
cd ~/devops-code-challenge3/terraform

terraform plan

Expected:
No changes. Your infrastructure matches the configuration.

EC2 Public IP
terraform output ec2_public_ip

Current:
100.61.115.64

EC2 Public DNS
terraform output ec2_public_dns

Current:
ec2-100-61-115-64.compute-1.amazonaws.com

Ansible
cd ~/devops-code-challenge3/ansible

ansible -i inventory.ini web -m ping

Expected:
pong

Nginx
SSH into EC2:
ssh -i ~/.ssh/jaymundo.pem ubuntu@100.61.115.64

Then:
systemctl status nginx

Expected:
active (running)

Website
Open:
http://100.61.115.64

Expected:
Hello, World!

Deployed with Terraform and Ansible.

⌨️ Command Cheat Sheet
Terraform
# Initialize
terraform init

# Validate
terraform validate

# Format
terraform fmt

# Plan
terraform plan

# Apply
terraform apply

# Show outputs
terraform output

# Show EC2 IP
terraform output ec2_public_ip

# Destroy
terraform destroy

Ansible
# Test connectivity
ansible -i inventory.ini web -m ping

# Run playbook
ansible-playbook -i inventory.ini playbook.yml

# Verbose output
ansible-playbook -i inventory.ini playbook.yml -v

SSH
ssh -i ~/.ssh/jaymundo.pem ubuntu@<EC2_PUBLIC_IP>

Git
# Check status
git status

# Add README
git add README.md

# Commit
git commit -m "Expand Challenge 3 documentation"

# Push
git push

💰 AWS Costs
AWS resources can generate charges depending on usage, region, account status, and current AWS pricing.
Potentially billable resources include:
Resource	Potential Cost
EC2 t4g.micro	Compute usage
EBS	Root volume storage
Public IPv4	Public IPv4 address usage
S3	Storage and requests
Data Transfer	Depending on traffic


No NAT Gateway
This project does not use a NAT Gateway.
This keeps the architecture simpler and avoids one of the more expensive networking components commonly found in AWS architectures.
🚫 Resources Not Used
This project intentionally does not use:
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

Those technologies belong to other projects and were not required for this challenge.
Keeping the architecture focused on the challenge requirements reduces unnecessary complexity and potential cost.
🧹 Cleanup
Once the challenge has been reviewed, graded, and submitted, the infrastructure can be removed with:
cd ~/devops-code-challenge3/terraform

terraform destroy

Terraform will display the resources it plans to remove.
Review the plan carefully before confirming.
Enter a value: yes

⚠️ Do not run terraform destroy while the project still needs to remain online for mentor review, grading, or submission.

🎤 Interview Explanation
⭐ 60-Second Interview Answer
"For this project, I used Terraform to provision AWS infrastructure including a VPC, public subnet, Internet Gateway, route table, Security Group, IAM role, S3 bucket, and an EC2 instance. Once the infrastructure was created, I used Ansible over SSH to configure the EC2 server, install and enable Nginx, and deploy a simple Hello World webpage. This project helped me demonstrate the separation between infrastructure provisioning with Terraform and server configuration with Ansible."

💬 What Is Terraform?
Interview Answer
"Terraform is an Infrastructure as Code tool. Instead of manually creating AWS resources through the console, I define the infrastructure in configuration files and Terraform creates and manages those resources for me."

💬 What Is Ansible?
Interview Answer
"Ansible is a configuration management and automation tool. In this project, I used it to connect to the EC2 instance over SSH, install Nginx, start the service, and deploy the HTML webpage."

💬 Terraform vs Ansible
Interview Answer
"Terraform creates the infrastructure, while Ansible configures the infrastructure. Terraform created my VPC, subnet, Security Group, IAM resources, S3 bucket, and EC2 instance. Ansible then connected to that EC2 instance and installed and configured Nginx."

💬 How Did You Make EC2 Public?
Interview Answer
"The EC2 instance was placed in a public subnet inside a VPC. The subnet's route table has a default route through an Internet Gateway. The EC2 instance also has a public IP address, and its Security Group allows HTTP traffic on port 80. That allows users on the internet to reach Nginx."

💬 Explain the Security Group
Interview Answer
"The Security Group allows SSH on port 22 only from my administrator IP address and allows HTTP on port 80 from the internet. Outbound traffic is allowed. This provides public web access while restricting SSH access."

💬 Explain the Deployment
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

💡 Skills Demonstrated
☁️ AWS
- Amazon EC2
- Amazon VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Security Groups
- IAM
- S3
- Public IPv4 networking
🏗️ Infrastructure as Code
- Terraform
- Terraform Providers
- Terraform Resources
- Terraform Data Sources
- Terraform Variables
- Terraform Outputs
- Terraform State
- Terraform Planning
- Resource Replacement
- Infrastructure Validation
🤖 Configuration Management
- Ansible
- Ansible Inventory
- Ansible Modules
- Ansible Playbooks
- SSH Connectivity
- Privilege Escalation
- Idempotent Configuration
🐧 Linux
- Ubuntu
- SSH
- systemctl
- Package Management
- File Permissions
- Web Server Configuration
🌐 Web Infrastructure
- Nginx
- HTTP
- Port 80
- HTML
- /var/www/html
🔀 DevOps
- Infrastructure as Code
- Configuration Management
- Automation
- Git
- GitHub
- Troubleshooting
- Infrastructure Verification
🏛️ Architecture Summary
                         👤 USER
                           │
                           │ HTTP :80
                           ▼
                 ┌────────────────────┐
                 │  Internet Gateway  │
                 └──────────┬─────────┘
                            │
                            ▼
        ┌───────────────────────────────────┐
        │              VPC                  │
        │           10.0.0.0/16             │
        │                                   │
        │    ┌─────────────────────────┐    │
        │    │      Public Subnet      │    │
        │    │       10.0.1.0/24       │    │
        │    │                         │    │
        │    │    ┌───────────────┐    │    │
        │    │    │      EC2      │    │    │
        │    │    │               │    │    │
        │    │    │ Ubuntu 24.04  │    │    │
        │    │    │               │    │    │
        │    │    │     Nginx     │    │    │
        │    │    │               │    │    │
        │    │    └───────────────┘    │    │
        │    └─────────────────────────┘    │
        │                                   │
        └───────────────────────────────────┘

Infrastructure Automation
             TERRAFORM
                 │
                 ▼
       ┌──────────────────┐
       │ AWS Infrastructure│
       └────────┬─────────┘
                │
                ▼
               EC2
                │
                │ SSH
                ▼
             ANSIBLE
                │
       ┌────────┼────────┐
       ▼        ▼        ▼
    Install   Start    Deploy
    Nginx     Nginx     HTML
       │        │        │
       └────────┼────────┘
                ▼
              NGINX
                │
                ▼
           🌎 WEBSITE

📦 Final Deliverables
GitHub Repository
🔗 Repository
https://github.com/jay-mundo/devops-code-challenge3

🌎 Web Application
http://100.61.115.64

🏗️ Terraform-Managed Infrastructure
VPC
Public Subnet
Internet Gateway
Route Table
Security Group
IAM Role
IAM Instance Profile
S3 Bucket
EC2 Instance

🤖 Ansible-Managed Configuration
Nginx
Nginx Service
Hello World HTML

📍 Current Deployment
Component	Value
AWS Region	us-east-1
EC2 Instance ID	i-0ba493df955aa9829
Public IP	100.61.115.64
Public DNS	ec2-100-61-115-64.compute-1.amazonaws.com
Instance Type	t4g.micro
OS	Ubuntu 24.04 LTS ARM64
Web Server	Nginx
S3 Bucket	devops-code-challenge3-d1719b880fece883cc759a7724


🌎 Live Website
http://100.61.115.64
🎓 Final Takeaway
This project demonstrates a complete Infrastructure as Code + Configuration Management workflow.
Instead of manually building infrastructure and configuring a server through the AWS Console, the environment is reproducible through code.
Terraform
🏗️ Builds the infrastructure

Ansible
🤖 Configures the server

Nginx
🌐 Serves the web application

AWS
☁️ Provides the cloud infrastructure

🔄 Complete Workflow
             TERRAFORM
                 │
                 ▼
       AWS INFRASTRUCTURE
                 │
                 ▼
                EC2
                 │
                 ▼
                SSH
                 │
                 ▼
              ANSIBLE
                 │
                 ▼
               NGINX
                 │
                 ▼
               HTML
                 │
                 ▼
          🌎 PUBLIC WEBSITE

The Most Important Lesson
Terraform builds the environment. Ansible configures the server.

Together, they create a repeatable and automated DevOps deployment process.
✅ Project Status
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
🏁 Final Result
☁️ AWS Infrastructure
        │
        ▼
🏗️ Terraform
        │
        ▼
💻 EC2 Web Server
        │
        ▼
🤖 Ansible
        │
        ▼
🌐 Nginx
        │
        ▼
📄 Hello World Website

🎉 AWS DevOps Code Challenge 3 Successfully Completed!