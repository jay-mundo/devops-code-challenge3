# AWS DevOps Code Challenge 3

**Infrastructure as Code + Configuration Management: building an AWS server with Terraform and configuring it automatically with Ansible.**

[![AWS](https://img.shields.io/badge/AWS-EC2%20%7C%20S3%20%7C%20VPC-orange)](#)
[![Terraform](https://img.shields.io/badge/IaC-Terraform-7B42BC)](#)
[![Ansible](https://img.shields.io/badge/Configuration-Ansible-EE0000)](#)
[![Nginx](https://img.shields.io/badge/Web%20Server-Nginx-009639)](#)
<<<<<<< HEAD
[![Linux](https://img.shields.io/badge/Linux-Ubuntu-E95420)](#)

---

## Table of Contents
=======
[![Ubuntu](https://img.shields.io/badge/Linux-Ubuntu-E95420)](#)

---

## 📋 Table of Contents
>>>>>>> bb4d78c (Expand Challenge 3 documentation)

1. [The 60-Second Summary](#1-the-60-second-summary)
2. [Start Here: What Is "The Cloud"?](#2-start-here-what-is-the-cloud)
3. [Plain-English Glossary](#3-plain-english-glossary)
4. [The Application](#4-the-application)
5. [The Big Picture](#5-the-big-picture)
6. [What Happens When Someone Visits the Website](#6-what-happens-when-someone-visits-the-website)
7. [Technologies Used](#7-technologies-used)
8. [Project Structure](#8-project-structure)
9. [Prerequisites](#9-prerequisites)
10. [Terraform: Building the Infrastructure with Code](#10-terraform-building-the-infrastructure-with-code)
11. [Networking: The AWS VPC](#11-networking-the-aws-vpc)
12. [Security Group: The Firewall](#12-security-group-the-firewall)
13. [IAM: Giving EC2 an Identity](#13-iam-giving-ec2-an-identity)
14. [Amazon S3: Object Storage](#14-amazon-s3-object-storage)
15. [Amazon EC2: The Web Server](#15-amazon-ec2-the-web-server)
16. [SSH: Connecting to the Server](#16-ssh-connecting-to-the-server)
17. [Ansible: Configuring the Server](#17-ansible-configuring-the-server)
18. [Ansible Inventory](#18-ansible-inventory)
19. [Ansible Playbook](#19-ansible-playbook)
20. [Nginx: Serving the Website](#20-nginx-serving-the-website)
21. [Terraform vs. Ansible](#21-terraform-vs-ansible)
22. [End-to-End Deployment](#22-end-to-end-deployment)
23. [Security Practices](#23-security-practices)
24. [Troubleshooting Lessons](#24-troubleshooting-lessons)
25. [Verification: Proof It Works](#25-verification-proof-it-works)
26. [Command Cheat Sheet](#26-command-cheat-sheet)
27. [Cost Considerations and Cleanup](#27-cost-considerations-and-cleanup)
28. [Interview Explanation](#28-interview-explanation)
29. [Skills Demonstrated](#29-skills-demonstrated)
30. [Final Architecture Summary](#30-final-architecture-summary)
31. [Final Deliverables](#31-final-deliverables)
32. [Project Status](#32-project-status)

<<<<<<< HEAD
---

# 1. The 60-Second Summary

I built a simple **"Hello, World!" web server** on AWS and automated the entire infrastructure and server configuration using **Terraform and Ansible**.

The website itself is intentionally simple.

The real project is everything around it:

| Goal | How it was achieved |
|------|---------------------|
| Create cloud infrastructure | **Terraform** |
| Create an isolated AWS network | **Amazon VPC** |
| Create a cloud server | **Amazon EC2** |
| Control network traffic | **Security Group** |
| Give EC2 an AWS identity | **IAM Role** |
| Create object storage | **Amazon S3** |
| Configure the Linux server automatically | **Ansible** |
| Install a web server | **Nginx** |
| Deploy the webpage | **Ansible** |
| Make the website publicly accessible | **EC2 Public IP + HTTP** |
| Avoid manual AWS configuration | **Infrastructure as Code** |

The result is a fully automated flow:

```mermaid
flowchart LR
    A["Terraform code"] --> B["AWS Infrastructure"]
    B --> C["EC2 Ubuntu Server"]
    C --> D["Ansible"]
    D --> E["Install Nginx"]
    E --> F["Deploy index.html"]
    F --> G["Hello, World!"]

2. Start Here: What Is "The Cloud"?
If you already understand cloud computing, skip to Section 4.

The simple definition
The cloud means renting computers and other technology resources from a company like Amazon and using them over the internet.
Instead of buying physical servers, installing them in an office, powering them, cooling them, and maintaining them yourself, AWS allows you to create servers in minutes.
For this project, AWS provides the infrastructure while Terraform and Ansible automate the work.
An analogy: Building a house
Cloud concept	House analogy
AWS	The company providing the land and utilities
VPC	Your private neighborhood
Subnet	A specific street in the neighborhood
EC2	Your actual house
Security Group	The security system and front-door rules
IAM Role	The identification/permissions given to the house
S3	A storage warehouse
Terraform	The architectural blueprint
Ansible	The contractor who enters the house and sets everything up
Nginx	The service running inside the house
Web page	The final product visitors see


Why does this matter?
Without automation, an engineer could manually:
1. Create a VPC
2. Create a subnet
3. Create an Internet Gateway
4. Configure routes
5. Create a Security Group
6. Launch an EC2 instance
7. SSH into the server
8. Install Nginx
9. Configure Nginx
10. Create the webpage
11. Verify the application
That works, but it is slow and difficult to reproduce.
With Terraform + Ansible, the process becomes:
Terraform
    ↓
Build AWS infrastructure
    ↓
EC2 server exists
    ↓
Ansible
    ↓
Install and configure software
    ↓
Website is ready

This is the fundamental idea behind Infrastructure as Code (IaC) and configuration management.
3. Plain-English Glossary
Term	What it means in simple words
AWS	Amazon's cloud platform
Region	A geographic area where AWS resources live
Availability Zone (AZ)	A separate AWS data center within a region
VPC	A private network inside AWS
Subnet	A smaller network inside a VPC
Public Subnet	A subnet that can route traffic to the internet
Internet Gateway	The doorway between a VPC and the internet
Route Table	Rules that determine where network traffic goes
EC2	A virtual computer/server running in AWS
Security Group	A virtual firewall for AWS resources
SSH	A secure way to remotely connect to a Linux server
IAM	AWS's identity and permission system
IAM Role	An identity that AWS resources can assume
S3	AWS object storage
Terraform	A tool that creates and manages infrastructure using code
IaC	Infrastructure as Code
Ansible	A tool used to configure and manage servers
Playbook	An Ansible file describing what configuration tasks to perform
Inventory	A list of servers Ansible manages
Nginx	A web server that serves websites
Ubuntu	The Linux operating system used by the EC2 instance
HTTP	The protocol used to access the website
Port 22	Standard SSH port
Port 80	Standard HTTP web traffic port
Terraform State	Terraform's record of infrastructure it manages


4. The Application
The application is intentionally simple.
It is a static Hello World webpage served by Nginx.
When a visitor opens the EC2 public IP address, they see:
Hello, World!

Deployed with Terraform and Ansible.

The webpage is stored at:
/var/www/html/index.html

The web server is:
Nginx

The operating system is:
Ubuntu 24.04 LTS

The server listens for HTTP traffic on:
Port 80

5. The Big Picture
This is the entire project on one page.
#chatgpt-mermaid-_r_1jqm_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1jqm_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1jqm_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1jqm_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1jqm_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqm_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1jqm_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1jqm_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1jqm_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1jqm_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1jqm_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1jqm_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqm_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqm_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1jqm_ p{margin:0;}#chatgpt-mermaid-_r_1jqm_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqm_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqm_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqm_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1jqm_ .label text,#chatgpt-mermaid-_r_1jqm_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqm_ .node rect,#chatgpt-mermaid-_r_1jqm_ .node circle,#chatgpt-mermaid-_r_1jqm_ .node ellipse,#chatgpt-mermaid-_r_1jqm_ .node polygon,#chatgpt-mermaid-_r_1jqm_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1jqm_ .rough-node .label text,#chatgpt-mermaid-_r_1jqm_ .node .label text,#chatgpt-mermaid-_r_1jqm_ .image-shape .label,#chatgpt-mermaid-_r_1jqm_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1jqm_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1jqm_ .rough-node .label,#chatgpt-mermaid-_r_1jqm_ .node .label,#chatgpt-mermaid-_r_1jqm_ .image-shape .label,#chatgpt-mermaid-_r_1jqm_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1jqm_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1jqm_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqm_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqm_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1jqm_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1jqm_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1jqm_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jqm_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jqm_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1jqm_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1jqm_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqm_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqm_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1jqm_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqm_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1jqm_ .icon-shape,#chatgpt-mermaid-_r_1jqm_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1jqm_ .icon-shape p,#chatgpt-mermaid-_r_1jqm_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1jqm_ .icon-shape .label rect,#chatgpt-mermaid-_r_1jqm_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jqm_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1jqm_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1jqm_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1jqm_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1jqm_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1jqm_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1jqm_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqm_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1jqm_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqm_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1jqm_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1jqm_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1jqm_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1jqm_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1jqm_ .node rect,#chatgpt-mermaid-_r_1jqm_ .node circle,#chatgpt-mermaid-_r_1jqm_ .node ellipse,#chatgpt-mermaid-_r_1jqm_ .node polygon,#chatgpt-mermaid-_r_1jqm_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1jqm_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1jqm_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1jqm_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1jqm_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqm_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}AWS Cloud - us-east-1VPC 10.0.0.0/16Public Subnet10.0.1.0/24Security GroupFirewallEC2Ubuntu 24.04t4g.microNginxPort 80index.htmlHello, World!Internet GatewayAmazon S3Object StorageIAM RoleVisitoron the internetHTTP :80




The infrastructure automation flow
#chatgpt-mermaid-_r_1jqv_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1jqv_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1jqv_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1jqv_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1jqv_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqv_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1jqv_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1jqv_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1jqv_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1jqv_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1jqv_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1jqv_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqv_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqv_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1jqv_ p{margin:0;}#chatgpt-mermaid-_r_1jqv_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqv_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqv_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqv_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1jqv_ .label text,#chatgpt-mermaid-_r_1jqv_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqv_ .node rect,#chatgpt-mermaid-_r_1jqv_ .node circle,#chatgpt-mermaid-_r_1jqv_ .node ellipse,#chatgpt-mermaid-_r_1jqv_ .node polygon,#chatgpt-mermaid-_r_1jqv_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1jqv_ .rough-node .label text,#chatgpt-mermaid-_r_1jqv_ .node .label text,#chatgpt-mermaid-_r_1jqv_ .image-shape .label,#chatgpt-mermaid-_r_1jqv_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1jqv_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1jqv_ .rough-node .label,#chatgpt-mermaid-_r_1jqv_ .node .label,#chatgpt-mermaid-_r_1jqv_ .image-shape .label,#chatgpt-mermaid-_r_1jqv_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1jqv_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1jqv_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqv_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqv_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1jqv_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1jqv_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1jqv_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jqv_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jqv_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1jqv_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1jqv_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqv_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqv_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1jqv_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jqv_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1jqv_ .icon-shape,#chatgpt-mermaid-_r_1jqv_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1jqv_ .icon-shape p,#chatgpt-mermaid-_r_1jqv_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1jqv_ .icon-shape .label rect,#chatgpt-mermaid-_r_1jqv_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jqv_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1jqv_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1jqv_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1jqv_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1jqv_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1jqv_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1jqv_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqv_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1jqv_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jqv_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1jqv_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1jqv_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1jqv_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1jqv_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1jqv_ .node rect,#chatgpt-mermaid-_r_1jqv_ .node circle,#chatgpt-mermaid-_r_1jqv_ .node ellipse,#chatgpt-mermaid-_r_1jqv_ .node polygon,#chatgpt-mermaid-_r_1jqv_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1jqv_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1jqv_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1jqv_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1jqv_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jqv_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}DeveloperTerraformInfrastructure as CodeAWS InfrastructureEC2 ServerAnsibleConfiguration ManagementNginxHello WorldWeb Page




6. What Happens When Someone Visits the Website
A visitor only sees a simple webpage, but several AWS networking components work together behind the scenes.
index.htmlNginxEC2 ServerInternet Gatewayindex.htmlNginxEC2 ServerInternet Gateway#chatgpt-mermaid-_r_1jr8_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1jr8_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1jr8_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1jr8_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1jr8_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jr8_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1jr8_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1jr8_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1jr8_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1jr8_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1jr8_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1jr8_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jr8_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jr8_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1jr8_ p{margin:0;}#chatgpt-mermaid-_r_1jr8_ .actor{stroke:rgb(31, 78, 148);fill:rgb(26, 40, 61);stroke-width:1;}#chatgpt-mermaid-_r_1jr8_ rect.actor.outer-path[data-look="neo"]{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jr8_ rect.note[data-look="neo"]{stroke:rgb(58, 132, 63);fill:rgba(54, 54, 54, 0.96);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jr8_ text.actor>tspan{fill:rgb(255, 255, 255);stroke:none;}#chatgpt-mermaid-_r_1jr8_ .actor-line{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jr8_ .innerArc{stroke-width:1.5;stroke-dasharray:none;}#chatgpt-mermaid-_r_1jr8_ .messageLine0{stroke-width:1.5;stroke-dasharray:none;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jr8_ .messageLine1{stroke-width:1.5;stroke-dasharray:2,2;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jr8_ [id$="-arrowhead"] path{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jr8_ .sequenceNumber{fill:rgba(0, 0, 0, 0.498);}#chatgpt-mermaid-_r_1jr8_ [id$="-sequencenumber"]{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jr8_ [id$="-crosshead"] path{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jr8_ .messageText{fill:rgb(255, 255, 255);stroke:none;}#chatgpt-mermaid-_r_1jr8_ .labelBox{stroke:rgba(255, 255, 255, 0.082);fill:rgb(24, 24, 24);filter:none;}#chatgpt-mermaid-_r_1jr8_ .labelText,#chatgpt-mermaid-_r_1jr8_ .labelText>tspan{fill:rgb(255, 255, 255);stroke:none;}#chatgpt-mermaid-_r_1jr8_ .loopText,#chatgpt-mermaid-_r_1jr8_ .loopText>tspan{fill:rgb(255, 255, 255);stroke:none;}#chatgpt-mermaid-_r_1jr8_ .sectionTitle,#chatgpt-mermaid-_r_1jr8_ .sectionTitle>tspan{fill:rgb(255, 255, 255);stroke:none;}#chatgpt-mermaid-_r_1jr8_ .loopLine{stroke-width:2px;stroke-dasharray:2,2;stroke:rgba(255, 255, 255, 0.082);fill:rgba(255, 255, 255, 0.082);}#chatgpt-mermaid-_r_1jr8_ .note{stroke:rgb(58, 132, 63);fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1jr8_ .noteText,#chatgpt-mermaid-_r_1jr8_ .noteText>tspan{fill:rgb(255, 255, 255);stroke:none;font-weight:normal;}#chatgpt-mermaid-_r_1jr8_ .activation0{fill:rgba(54, 54, 54, 0.96);stroke:hsla(0, 0%, 11.1764705882%, 0.96);}#chatgpt-mermaid-_r_1jr8_ .activation1{fill:rgba(54, 54, 54, 0.96);stroke:hsla(0, 0%, 11.1764705882%, 0.96);}#chatgpt-mermaid-_r_1jr8_ .activation2{fill:rgba(54, 54, 54, 0.96);stroke:hsla(0, 0%, 11.1764705882%, 0.96);}#chatgpt-mermaid-_r_1jr8_ .actorPopupMenu{position:absolute;}#chatgpt-mermaid-_r_1jr8_ .actorPopupMenuPanel{position:absolute;fill:rgb(26, 40, 61);box-shadow:0px 8px 16px 0px rgba(0,0,0,0.2);filter:drop-shadow(3px 5px 2px rgb(0 0 0 / 0.4));}#chatgpt-mermaid-_r_1jr8_ .actor-man circle,#chatgpt-mermaid-_r_1jr8_ line{fill:rgb(26, 40, 61);stroke-width:2px;}#chatgpt-mermaid-_r_1jr8_ g rect.rect{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1jr8_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1jr8_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1jr8_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1jr8_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1jr8_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jr8_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1jr8_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jr8_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}VisitorOpens EC2 public IP1HTTP request on port 802Request reaches web server3Reads webpage4Hello World content5HTTP response6Response7Hello, World!8Visitor




In simple terms:
Internet
   ↓
Internet Gateway
   ↓
Public Subnet
   ↓
EC2
   ↓
Nginx
   ↓
index.html
   ↓
Hello, World!

7. Technologies Used
Technology	Purpose
AWS	Cloud infrastructure
Amazon VPC	Private networking
Amazon EC2	Web server
Amazon S3	Object storage
AWS IAM	Identity and access management
Security Groups	Network firewall
Internet Gateway	Internet connectivity
Ubuntu 24.04	Server operating system
Terraform	Infrastructure as Code
Ansible	Server configuration
Nginx	Web server
SSH	Remote server access
GitHub	Source control


8. Project Structure
The repository is organized into separate Terraform and Ansible directories.
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

Why separate Terraform and Ansible?
They solve two different problems.
Terraform
    ↓
"Create the server."

Ansible
    ↓
"Configure the server."

Keeping them separate makes the project easier to understand, maintain, and troubleshoot.
9. Prerequisites
Before running this project, the following tools are required.
Tool	Purpose
AWS CLI	Communicate with AWS
Terraform	Build infrastructure
Ansible	Configure EC2
Git	Source control
SSH	Connect to EC2
AWS account	Host the infrastructure


Verify the tools
aws --version
terraform version
ansible --version
git --version
ssh -V

AWS authentication
Verify that the AWS CLI is authenticated:
aws sts get-caller-identity

The command should return the AWS account and identity being used.
10. Terraform: Building the Infrastructure with Code
What is Terraform?
Terraform allows infrastructure to be described using code.
Instead of manually clicking through the AWS Console, Terraform reads .tf files and creates the required resources.
#chatgpt-mermaid-_r_1jta_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1jta_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1jta_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1jta_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1jta_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jta_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1jta_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1jta_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1jta_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1jta_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1jta_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1jta_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jta_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jta_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1jta_ p{margin:0;}#chatgpt-mermaid-_r_1jta_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jta_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jta_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jta_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1jta_ .label text,#chatgpt-mermaid-_r_1jta_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jta_ .node rect,#chatgpt-mermaid-_r_1jta_ .node circle,#chatgpt-mermaid-_r_1jta_ .node ellipse,#chatgpt-mermaid-_r_1jta_ .node polygon,#chatgpt-mermaid-_r_1jta_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1jta_ .rough-node .label text,#chatgpt-mermaid-_r_1jta_ .node .label text,#chatgpt-mermaid-_r_1jta_ .image-shape .label,#chatgpt-mermaid-_r_1jta_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1jta_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1jta_ .rough-node .label,#chatgpt-mermaid-_r_1jta_ .node .label,#chatgpt-mermaid-_r_1jta_ .image-shape .label,#chatgpt-mermaid-_r_1jta_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1jta_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1jta_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jta_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jta_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1jta_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1jta_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1jta_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jta_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jta_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1jta_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1jta_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jta_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jta_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1jta_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1jta_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1jta_ .icon-shape,#chatgpt-mermaid-_r_1jta_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1jta_ .icon-shape p,#chatgpt-mermaid-_r_1jta_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1jta_ .icon-shape .label rect,#chatgpt-mermaid-_r_1jta_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1jta_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1jta_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1jta_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1jta_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1jta_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1jta_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1jta_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1jta_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1jta_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jta_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1jta_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1jta_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1jta_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1jta_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1jta_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1jta_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1jta_ .node rect,#chatgpt-mermaid-_r_1jta_ .node circle,#chatgpt-mermaid-_r_1jta_ .node ellipse,#chatgpt-mermaid-_r_1jta_ .node polygon,#chatgpt-mermaid-_r_1jta_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1jta_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1jta_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1jta_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1jta_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1jta_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}Terraform .tf filesterraform initterraform validateterraform planPreview changesterraform applyBuild infrastructureAWS Resources




Terraform workflow
Step 1 — Initialize Terraform
terraform init

This downloads the AWS provider and prepares the working directory.
Step 2 — Validate the configuration
terraform validate

Expected result:
Success! The configuration is valid.

Step 3 — Preview the infrastructure
terraform plan

Terraform shows what it intends to create, change, or destroy.
Step 4 — Create the infrastructure
terraform apply

Terraform then creates the AWS resources.
Terraform configuration
The provider is configured for:
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "us-east-1"
}

Terraform resources created
AWS VPC
    ↓
Public Subnet
    ↓
Internet Gateway
    ↓
Route Table
    ↓
Security Group
    ↓
IAM Role + Instance Profile
    ↓
EC2 Instance
    ↓
S3 Bucket

The final Terraform plan showed:
No changes. Your infrastructure matches the configuration.

This confirms that the deployed AWS infrastructure matches the Terraform configuration.
11. Networking: The AWS VPC
What is a VPC?
A VPC (Virtual Private Cloud) is a private network inside AWS.
Think of it like a gated neighborhood.
Inside that neighborhood are:
- Subnets
- Servers
- Route tables
- Security controls
- Internet connectivity
This project uses:
VPC CIDR:
10.0.0.0/16

Network architecture
#chatgpt-mermaid-_r_1k02_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1k02_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1k02_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1k02_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1k02_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k02_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1k02_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1k02_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1k02_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1k02_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1k02_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1k02_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k02_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k02_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1k02_ p{margin:0;}#chatgpt-mermaid-_r_1k02_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k02_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k02_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k02_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1k02_ .label text,#chatgpt-mermaid-_r_1k02_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k02_ .node rect,#chatgpt-mermaid-_r_1k02_ .node circle,#chatgpt-mermaid-_r_1k02_ .node ellipse,#chatgpt-mermaid-_r_1k02_ .node polygon,#chatgpt-mermaid-_r_1k02_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1k02_ .rough-node .label text,#chatgpt-mermaid-_r_1k02_ .node .label text,#chatgpt-mermaid-_r_1k02_ .image-shape .label,#chatgpt-mermaid-_r_1k02_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1k02_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1k02_ .rough-node .label,#chatgpt-mermaid-_r_1k02_ .node .label,#chatgpt-mermaid-_r_1k02_ .image-shape .label,#chatgpt-mermaid-_r_1k02_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1k02_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1k02_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k02_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k02_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1k02_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1k02_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1k02_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k02_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k02_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1k02_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1k02_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k02_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k02_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1k02_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k02_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1k02_ .icon-shape,#chatgpt-mermaid-_r_1k02_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1k02_ .icon-shape p,#chatgpt-mermaid-_r_1k02_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1k02_ .icon-shape .label rect,#chatgpt-mermaid-_r_1k02_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k02_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1k02_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1k02_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1k02_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1k02_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1k02_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1k02_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1k02_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1k02_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k02_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1k02_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k02_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1k02_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1k02_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1k02_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1k02_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1k02_ .node rect,#chatgpt-mermaid-_r_1k02_ .node circle,#chatgpt-mermaid-_r_1k02_ .node ellipse,#chatgpt-mermaid-_r_1k02_ .node polygon,#chatgpt-mermaid-_r_1k02_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1k02_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1k02_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1k02_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1k02_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k02_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}VPC 10.0.0.0/16Public Subnet 10.0.1.0/24us-east-1aPublic Route TableEC2 Web ServerInternetInternet Gateway




VPC configuration
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "devops-code-challenge3-vpc"
  }
}

12. Security Group: The Firewall
A Security Group acts like a firewall around the EC2 instance.
This project allows:
Port	Protocol	Purpose	Source
22	TCP	SSH	Administrator public IP
80	TCP	HTTP	Internet
All	Outbound	Server communication	Internet


The SSH rule is restricted to the administrator's public IP rather than opening SSH to the entire internet.
Example:
variable "admin_cidr" {
  description = "Public IP address allowed to SSH into the EC2 instance"
  type        = string
}

SSH access:
ingress {
  description = "SSH from administrator"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = [var.admin_cidr]
}

HTTP access:
ingress {
  description = "HTTP from the internet"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

Why is HTTP open to everyone?
Because the website is intended to be publicly accessible.
Why isn't SSH open to everyone?
Because SSH provides administrative access to the server and should be restricted whenever possible.
13. IAM: Giving EC2 an Identity
What is IAM?
IAM stands for Identity and Access Management.
It controls who or what can access AWS resources.
This project creates an IAM role for EC2.
#chatgpt-mermaid-_r_1k2g_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1k2g_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1k2g_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1k2g_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1k2g_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k2g_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1k2g_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1k2g_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1k2g_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1k2g_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1k2g_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1k2g_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k2g_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k2g_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1k2g_ p{margin:0;}#chatgpt-mermaid-_r_1k2g_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k2g_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k2g_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k2g_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1k2g_ .label text,#chatgpt-mermaid-_r_1k2g_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k2g_ .node rect,#chatgpt-mermaid-_r_1k2g_ .node circle,#chatgpt-mermaid-_r_1k2g_ .node ellipse,#chatgpt-mermaid-_r_1k2g_ .node polygon,#chatgpt-mermaid-_r_1k2g_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1k2g_ .rough-node .label text,#chatgpt-mermaid-_r_1k2g_ .node .label text,#chatgpt-mermaid-_r_1k2g_ .image-shape .label,#chatgpt-mermaid-_r_1k2g_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1k2g_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1k2g_ .rough-node .label,#chatgpt-mermaid-_r_1k2g_ .node .label,#chatgpt-mermaid-_r_1k2g_ .image-shape .label,#chatgpt-mermaid-_r_1k2g_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1k2g_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1k2g_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k2g_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k2g_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1k2g_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1k2g_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1k2g_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k2g_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k2g_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1k2g_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1k2g_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k2g_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k2g_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1k2g_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k2g_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1k2g_ .icon-shape,#chatgpt-mermaid-_r_1k2g_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1k2g_ .icon-shape p,#chatgpt-mermaid-_r_1k2g_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1k2g_ .icon-shape .label rect,#chatgpt-mermaid-_r_1k2g_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k2g_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1k2g_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1k2g_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1k2g_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1k2g_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1k2g_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1k2g_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k2g_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1k2g_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k2g_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1k2g_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1k2g_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1k2g_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1k2g_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1k2g_ .node rect,#chatgpt-mermaid-_r_1k2g_ .node circle,#chatgpt-mermaid-_r_1k2g_ .node ellipse,#chatgpt-mermaid-_r_1k2g_ .node polygon,#chatgpt-mermaid-_r_1k2g_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1k2g_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1k2g_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1k2g_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1k2g_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k2g_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}EC2 InstanceIAM Instance ProfileIAM Role




The role uses an EC2 trust relationship:
Principal = {
  Service = "ec2.amazonaws.com"
}

This allows the EC2 service to assume the role.
Important security note
The project creates the IAM role and instance profile, but does not attach an AWS permissions policy to the role.
Therefore, the role does not automatically grant the EC2 instance access to S3 or other AWS services.
This follows the principle of not granting unnecessary permissions.
14. Amazon S3: Object Storage
What is S3?
Amazon S3 is AWS object storage.
It can be used to store things such as:
- Files
- Images
- Backups
- Logs
- Application assets
- Data
This project creates an S3 bucket as part of the infrastructure requirement.
The bucket was created using Terraform:
resource "aws_s3_bucket" "challenge" {
  bucket_prefix = "devops-code-challenge3-"

  tags = {
    Name = "devops-code-challenge3-bucket"
  }
}

The deployed bucket is:
devops-code-challenge3-d1719b880fece883cc759a7724

Important distinction
The S3 bucket is not hosting the Hello World webpage.
The webpage is served by Nginx on the EC2 instance.
S3 exists as an AWS object-storage resource required by the challenge.
15. Amazon EC2: The Web Server
What is EC2?
Amazon EC2 provides virtual machines in AWS.
For this project, Terraform launches an Ubuntu server.
Setting	Value
Operating System	Ubuntu 24.04 LTS
Architecture	ARM64
Instance Type	t4g.micro
Region	us-east-1
Availability Zone	us-east-1a
Public IP	100.61.115.64
Web Port	80
SSH Port	22


The EC2 instance is placed inside the public subnet.
EC2 Terraform configuration
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

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t4g.micro"

  key_name = "jaymundo"

  subnet_id               = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2.name

  tags = {
    Name = "devops-code-challenge3-web-server"
  }
}

16. SSH: Connecting to the Server
What is SSH?
SSH (Secure Shell) allows an administrator to securely connect to a remote Linux server.
The EC2 instance uses the SSH key:
jaymundo.pem

The key is stored locally and is not committed to GitHub.
The .gitignore contains:
*.pem
*.key

Connecting to EC2
ssh -i ~/.ssh/jaymundo.pem ubuntu@100.61.115.64

The successful connection confirms that:
- EC2 is running
- The public IP is reachable
- Port 22 is accessible
- The Security Group allows SSH
- The SSH key is correct
- Ubuntu is accepting connections
17. Ansible: Configuring the Server
What is Ansible?
Terraform creates infrastructure.
Ansible configures that infrastructure.
This distinction is extremely important.
Terraform
"Create the server."

        ↓

EC2 exists

        ↓

Ansible
"Configure the server."

        ↓

Nginx installed
        ↓
Nginx running
        ↓
Website deployed

Ansible workflow
#chatgpt-mermaid-_r_1k51_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1k51_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1k51_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1k51_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1k51_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k51_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1k51_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1k51_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1k51_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1k51_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1k51_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1k51_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k51_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k51_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1k51_ p{margin:0;}#chatgpt-mermaid-_r_1k51_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k51_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k51_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k51_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1k51_ .label text,#chatgpt-mermaid-_r_1k51_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k51_ .node rect,#chatgpt-mermaid-_r_1k51_ .node circle,#chatgpt-mermaid-_r_1k51_ .node ellipse,#chatgpt-mermaid-_r_1k51_ .node polygon,#chatgpt-mermaid-_r_1k51_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1k51_ .rough-node .label text,#chatgpt-mermaid-_r_1k51_ .node .label text,#chatgpt-mermaid-_r_1k51_ .image-shape .label,#chatgpt-mermaid-_r_1k51_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1k51_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1k51_ .rough-node .label,#chatgpt-mermaid-_r_1k51_ .node .label,#chatgpt-mermaid-_r_1k51_ .image-shape .label,#chatgpt-mermaid-_r_1k51_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1k51_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1k51_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k51_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k51_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1k51_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1k51_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1k51_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k51_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k51_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1k51_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1k51_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k51_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k51_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1k51_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1k51_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1k51_ .icon-shape,#chatgpt-mermaid-_r_1k51_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1k51_ .icon-shape p,#chatgpt-mermaid-_r_1k51_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1k51_ .icon-shape .label rect,#chatgpt-mermaid-_r_1k51_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1k51_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1k51_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1k51_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1k51_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1k51_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1k51_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1k51_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1k51_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1k51_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k51_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1k51_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1k51_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1k51_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1k51_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1k51_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1k51_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1k51_ .node rect,#chatgpt-mermaid-_r_1k51_ .node circle,#chatgpt-mermaid-_r_1k51_ .node ellipse,#chatgpt-mermaid-_r_1k51_ .node polygon,#chatgpt-mermaid-_r_1k51_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1k51_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1k51_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1k51_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1k51_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1k51_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}inventory.iniplaybook.ymlSSHUbuntu EC2Update packagesInstall NginxStart and enable NginxDeploy index.html




18. Ansible Inventory
The inventory tells Ansible which servers it should manage and how to connect to them.
Current inventory:
[web]
100.61.115.64 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/jaymundo.pem

The inventory defines:
Setting	Value
Group	web
Server	100.61.115.64
SSH user	ubuntu
SSH key	~/.ssh/jaymundo.pem


Test Ansible connectivity
Before running the playbook, Ansible connectivity was tested using:
ansible -i inventory.ini web -m ping

Successful result:
100.61.115.64 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}

This proves that Ansible can communicate with the EC2 server.
19. Ansible Playbook
The playbook automatically configures the Ubuntu server.
=======
>>>>>>> bb4d78c (Expand Challenge 3 documentation)
---

<<<<<<< HEAD
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

What each task does
Task 1 — Update package information
- name: Update apt package cache

Makes sure Ubuntu has current package information.
Task 2 — Install Nginx
- name: Install Nginx

Installs the Nginx web server.
Task 3 — Start Nginx
- name: Ensure Nginx is running

Starts Nginx and enables it to automatically start when the server boots.
Task 4 — Deploy the webpage
- name: Deploy Hello World webpage

Creates:
/var/www/html/index.html

with the project's Hello World content.
Running the playbook
ansible-playbook -i inventory.ini playbook.yml

Successful execution:
PLAY RECAP
100.61.115.64 : ok=5 changed=3 unreachable=0 failed=0 skipped=0 rescued=0 ignored=0

The important value is:
failed=0

That means the configuration completed successfully.
20. Nginx: Serving the Website
What is Nginx?
Nginx is a web server.
Its job in this project is simple:
Receive HTTP request
        ↓
Find webpage
        ↓
Return webpage

The webpage lives at:
/var/www/html/index.html

Nginx listens on:
Port 80

Request flow
#chatgpt-mermaid-_r_1kb1_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1kb1_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1kb1_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1kb1_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1kb1_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kb1_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1kb1_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1kb1_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1kb1_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1kb1_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1kb1_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1kb1_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kb1_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kb1_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1kb1_ p{margin:0;}#chatgpt-mermaid-_r_1kb1_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kb1_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kb1_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kb1_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1kb1_ .label text,#chatgpt-mermaid-_r_1kb1_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kb1_ .node rect,#chatgpt-mermaid-_r_1kb1_ .node circle,#chatgpt-mermaid-_r_1kb1_ .node ellipse,#chatgpt-mermaid-_r_1kb1_ .node polygon,#chatgpt-mermaid-_r_1kb1_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1kb1_ .rough-node .label text,#chatgpt-mermaid-_r_1kb1_ .node .label text,#chatgpt-mermaid-_r_1kb1_ .image-shape .label,#chatgpt-mermaid-_r_1kb1_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1kb1_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1kb1_ .rough-node .label,#chatgpt-mermaid-_r_1kb1_ .node .label,#chatgpt-mermaid-_r_1kb1_ .image-shape .label,#chatgpt-mermaid-_r_1kb1_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1kb1_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1kb1_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kb1_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kb1_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1kb1_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1kb1_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1kb1_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kb1_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kb1_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1kb1_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1kb1_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kb1_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kb1_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1kb1_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kb1_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1kb1_ .icon-shape,#chatgpt-mermaid-_r_1kb1_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1kb1_ .icon-shape p,#chatgpt-mermaid-_r_1kb1_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1kb1_ .icon-shape .label rect,#chatgpt-mermaid-_r_1kb1_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kb1_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1kb1_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1kb1_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1kb1_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1kb1_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1kb1_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1kb1_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kb1_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1kb1_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kb1_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1kb1_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1kb1_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1kb1_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1kb1_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1kb1_ .node rect,#chatgpt-mermaid-_r_1kb1_ .node circle,#chatgpt-mermaid-_r_1kb1_ .node ellipse,#chatgpt-mermaid-_r_1kb1_ .node polygon,#chatgpt-mermaid-_r_1kb1_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1kb1_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1kb1_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1kb1_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1kb1_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kb1_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}Internet UserSecurity GroupAllow TCP 80EC2NginxPort 80/var/www/html/index.html




21. Terraform vs. Ansible
This is one of the most important concepts in the entire project.
	Terraform	Ansible
Main purpose	Build infrastructure	Configure servers
Category	Infrastructure as Code	Configuration Management
Creates EC2?	Yes	No
Creates VPC?	Yes	No
Creates Security Group?	Yes	No
Creates S3?	Yes	No
Installs Nginx?	No	Yes
Starts services?	No	Yes
Deploys webpage?	No	Yes
Communicates with server	AWS API	SSH
Example	"Build the house"	"Set up the house"


The easiest way to remember it
Terraform = BUILD

Ansible = CONFIGURE

Or:
Terraform builds the kitchen. Ansible stocks the kitchen and gets it ready to use.

22. End-to-End Deployment
The complete project follows this sequence.
#chatgpt-mermaid-_r_1kc4_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1kc4_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1kc4_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1kc4_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1kc4_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kc4_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1kc4_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1kc4_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1kc4_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1kc4_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1kc4_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1kc4_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kc4_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kc4_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1kc4_ p{margin:0;}#chatgpt-mermaid-_r_1kc4_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kc4_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kc4_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kc4_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1kc4_ .label text,#chatgpt-mermaid-_r_1kc4_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kc4_ .node rect,#chatgpt-mermaid-_r_1kc4_ .node circle,#chatgpt-mermaid-_r_1kc4_ .node ellipse,#chatgpt-mermaid-_r_1kc4_ .node polygon,#chatgpt-mermaid-_r_1kc4_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1kc4_ .rough-node .label text,#chatgpt-mermaid-_r_1kc4_ .node .label text,#chatgpt-mermaid-_r_1kc4_ .image-shape .label,#chatgpt-mermaid-_r_1kc4_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1kc4_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1kc4_ .rough-node .label,#chatgpt-mermaid-_r_1kc4_ .node .label,#chatgpt-mermaid-_r_1kc4_ .image-shape .label,#chatgpt-mermaid-_r_1kc4_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1kc4_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1kc4_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kc4_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kc4_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1kc4_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1kc4_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1kc4_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kc4_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kc4_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1kc4_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1kc4_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kc4_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kc4_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1kc4_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kc4_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1kc4_ .icon-shape,#chatgpt-mermaid-_r_1kc4_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1kc4_ .icon-shape p,#chatgpt-mermaid-_r_1kc4_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1kc4_ .icon-shape .label rect,#chatgpt-mermaid-_r_1kc4_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kc4_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1kc4_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1kc4_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1kc4_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1kc4_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1kc4_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1kc4_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kc4_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1kc4_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kc4_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1kc4_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1kc4_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1kc4_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1kc4_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1kc4_ .node rect,#chatgpt-mermaid-_r_1kc4_ .node circle,#chatgpt-mermaid-_r_1kc4_ .node ellipse,#chatgpt-mermaid-_r_1kc4_ .node polygon,#chatgpt-mermaid-_r_1kc4_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1kc4_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1kc4_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1kc4_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1kc4_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kc4_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}StartWrite Terraformconfigurationterraform initterraform validateterraform planterraform applyAWS infrastructure createdEC2 Ubuntu serverTest SSH connectivityCreate Ansible inventoryansible pingRun Ansible playbookNginx installed and runningHello World webpagedeployedTest public websiteDeployment complete




Step 1 — Clone the repository
git clone https://github.com/jay-mundo/devops-code-challenge3.git

cd devops-code-challenge3

Step 2 — Enter the Terraform directory
cd terraform

Step 3 — Initialize Terraform
terraform init

Step 4 — Validate
terraform validate

Step 5 — Review the plan
terraform plan

Step 6 — Apply infrastructure
terraform apply

Step 7 — Retrieve the EC2 IP
terraform output ec2_public_ip

Step 8 — Update the Ansible inventory
[web]
<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/jaymundo.pem

Step 9 — Test Ansible connectivity
cd ../ansible

ansible -i inventory.ini web -m ping

Expected:
SUCCESS
ping: pong

Step 10 — Run the playbook
ansible-playbook -i inventory.ini playbook.yml

Step 11 — Open the website
http://<EC2_PUBLIC_IP>

Expected:
Hello, World!

Deployed with Terraform and Ansible.

23. Security Practices
Security was considered throughout the deployment.
Practice	Why it matters
SSH restricted to administrator IP	Reduces unnecessary exposure
HTTP allowed publicly	Required for the public website
.pem files excluded from Git	Prevents private SSH keys from being committed
Terraform state excluded from Git	Prevents infrastructure state from being exposed
IAM role used for EC2	Provides an AWS identity without hard-coded credentials
No unnecessary IAM permissions attached	Follows least-privilege principles
Infrastructure managed through code	Easier to review and reproduce
Ubuntu server	Standard Linux cloud operating system


Sensitive files excluded from Git
The .gitignore contains:
.terraform/
*.tfstate
*.tfstate.*
*.tfvars
*.pem
*.key
.DS_Store

This prevents sensitive or environment-specific files from being accidentally committed.
24. Troubleshooting Lessons
1. EC2 replacement after adding the SSH key
Problem
The EC2 instance initially existed without the desired SSH key configuration.
Adding:
key_name = "jaymundo"

caused Terraform to replace the EC2 instance.
Result
Terraform reported:
Plan: 1 to add, 0 to change, 1 to destroy.

Lesson
Some EC2 properties cannot be changed in place.
Terraform may need to destroy and recreate the instance to achieve the desired configuration.
2. SSH connectivity
Problem
Before Ansible can configure a server, the server must be reachable.
Solution
SSH was tested manually:
ssh -i ~/.ssh/jaymundo.pem ubuntu@100.61.115.64

Lesson
Always test the underlying connection before troubleshooting Ansible.
The troubleshooting order should be:
AWS networking
      ↓
Security Group
      ↓
SSH
      ↓
Ansible
      ↓
Playbook

3. Ansible Python interpreter discovery
Ansible reported a Python interpreter discovery message when connecting to Ubuntu.
It discovered:
/usr/bin/python3.12

The playbook still completed successfully.
Lesson
Warnings do not always mean the deployment failed.
Always check the final play recap:
failed=0

4. Security Group access
Problem
A web server can be running correctly but still be unreachable from the internet.
Solution
The Security Group allows:
TCP 80 → 0.0.0.0/0

while SSH remains restricted to the administrator IP.
Lesson
Application availability depends on both:
- The application/server being healthy
- Network access being correctly configured
5. Terraform state
Terraform needs to know what resources it already manages.
The state file keeps track of the relationship between:
Terraform configuration
        ↓
Real AWS resources

The state files are intentionally excluded from Git.
25. Verification: Proof It Works
The project was verified at multiple layers.
Layer	Check	Result
Terraform	terraform validate	Configuration valid
Terraform	terraform plan	No changes
AWS	EC2 instance	Running
AWS	VPC	Created
AWS	S3	Created
Network	SSH	Successful
Ansible	ansible ping	pong
Ansible	Playbook	failed=0
Nginx	Service	Running
Website	HTTP request	Hello, World!


Final website
Live Demo
http://100.61.115.64
The deployed webpage displays:
Hello, World!

Deployed with Terraform and Ansible.

26. Command Cheat Sheet
<details>
<summary><strong>Terraform</strong></summary>

terraform init
terraform validate
terraform plan
terraform apply
terraform output
terraform output ec2_public_ip
terraform output ec2_public_dns
terraform output s3_bucket_name
terraform state list
terraform destroy

</details>

<details>
<summary><strong>AWS CLI</strong></summary>

aws sts get-caller-identity

aws ec2 describe-instances

aws s3 ls

aws s3api list-buckets

aws ec2 describe-security-groups

</details>

<details>
<summary><strong>SSH</strong></summary>

ssh -i ~/.ssh/jaymundo.pem ubuntu@<EC2_PUBLIC_IP>

</details>

<details>
<summary><strong>Ansible</strong></summary>

ansible --version

ansible -i inventory.ini web -m ping

ansible-playbook -i inventory.ini playbook.yml

</details>

<details>
<summary><strong>Nginx</strong></summary>

sudo systemctl status nginx

sudo systemctl start nginx

sudo systemctl restart nginx

sudo systemctl enable nginx

sudo nginx -t

</details>

<details>
<summary><strong>Linux / Server Troubleshooting</strong></summary>

ip addr

ip route

df -h

free -h

ps aux

systemctl status nginx

curl http://localhost

curl http://<EC2_PUBLIC_IP>

</details>

27. Cost Considerations and Cleanup
AWS resources can incur charges while they are running.
The main resources used in this project include:
- Amazon EC2
- Amazon S3
- Public IPv4 address
- Other AWS networking resources where applicable
The project uses a small EC2 instance:
t4g.micro

This helps keep the infrastructure relatively lightweight.
Important: AWS pricing can change, so always verify current pricing in the AWS Billing console before leaving resources running for an extended period.

Cleaning up
Once the project is no longer needed:
cd ~/devops-code-challenge3/terraform

terraform destroy

Terraform will show the resources that are going to be deleted.
Confirm only when you are ready to permanently remove the challenge infrastructure.
Important
Do not run:
terraform destroy

before submitting or demonstrating the project if the evaluator needs to access the live website.
28. Interview Explanation
A concise way to explain this project in an interview:
"I built and deployed a simple web application on AWS using Terraform and Ansible. Terraform was responsible for provisioning the AWS infrastructure, including the VPC, public subnet, Internet Gateway, route table, Security Group, IAM role, S3 bucket, and EC2 instance. Once the EC2 server was running, I used Ansible over SSH to configure the Ubuntu server, install and enable Nginx, and deploy a Hello World webpage. I separated infrastructure provisioning from server configuration so Terraform handled the infrastructure lifecycle while Ansible handled the operating-system and application configuration."

If the interviewer asks: "Why use both Terraform and Ansible?"
A simple answer:
"Terraform and Ansible solve different problems. Terraform is designed to provision infrastructure, while Ansible is designed to configure systems after they exist. In this project, Terraform created the AWS environment and EC2 instance, and Ansible installed Nginx and deployed the webpage."

If the interviewer asks: "Walk me through the architecture."
You can say:
"The application runs on an Ubuntu EC2 instance inside a public subnet in an AWS VPC. The VPC has an Internet Gateway and route table that allow internet traffic to reach the instance. A Security Group allows HTTP on port 80 and restricts SSH on port 22 to my administrator IP. After Terraform creates the infrastructure, Ansible connects over SSH, installs Nginx, starts the service, and deploys the HTML file. Nginx then serves the webpage to users over HTTP."

If the interviewer asks: "What was your biggest lesson?"
A strong answer:
"One of the biggest lessons was understanding the separation between infrastructure provisioning and configuration management. Terraform can create an EC2 instance, but that doesn't automatically mean the server is ready to serve an application. Ansible bridges that gap by connecting to the server and configuring the operating system and software."

29. Skills Demonstrated
Area	Skills
Cloud	AWS, EC2, VPC, S3, IAM, Security Groups
Infrastructure as Code	Terraform
Configuration Management	Ansible
Networking	VPC, Subnets, Internet Gateway, Route Tables
Linux	Ubuntu, systemd, apt, file permissions
Web Infrastructure	Nginx, HTTP, port 80
Remote Administration	SSH
Security	IAM roles, restricted SSH, Security Groups
Automation	Terraform + Ansible
Source Control	Git, GitHub
Troubleshooting	SSH, networking, Terraform replacement behavior, Ansible connectivity


30. Final Architecture Summary
The final architecture is intentionally simple but demonstrates several core cloud engineering concepts.
#chatgpt-mermaid-_r_1kll_{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;fill:rgb(255, 255, 255);}@keyframes edge-animation-frame{from{stroke-dashoffset:0;}}@keyframes dash{to{stroke-dashoffset:0;}}#chatgpt-mermaid-_r_1kll_ .edge-animation-slow{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 50s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1kll_ .edge-animation-fast{stroke-dasharray:9,5!important;stroke-dashoffset:900;animation:dash 20s linear infinite;stroke-linecap:round;}#chatgpt-mermaid-_r_1kll_ .error-icon{fill:rgba(54, 54, 54, 0.96);}#chatgpt-mermaid-_r_1kll_ .error-text{fill:rgb(255, 255, 255);stroke:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kll_ .edge-thickness-normal{stroke-width:1px;}#chatgpt-mermaid-_r_1kll_ .edge-thickness-thick{stroke-width:3.5px;}#chatgpt-mermaid-_r_1kll_ .edge-pattern-solid{stroke-dasharray:0;}#chatgpt-mermaid-_r_1kll_ .edge-thickness-invisible{stroke-width:0;fill:none;}#chatgpt-mermaid-_r_1kll_ .edge-pattern-dashed{stroke-dasharray:3;}#chatgpt-mermaid-_r_1kll_ .edge-pattern-dotted{stroke-dasharray:2;}#chatgpt-mermaid-_r_1kll_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kll_ .marker.cross{stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kll_ svg{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:14px;}#chatgpt-mermaid-_r_1kll_ p{margin:0;}#chatgpt-mermaid-_r_1kll_ .label{font-family:-apple-system,"system-ui","Segoe UI",sans-serif;color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kll_ .cluster-label text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kll_ .cluster-label span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kll_ .cluster-label span p{background-color:transparent;}#chatgpt-mermaid-_r_1kll_ .label text,#chatgpt-mermaid-_r_1kll_ span{fill:rgb(255, 255, 255);color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kll_ .node rect,#chatgpt-mermaid-_r_1kll_ .node circle,#chatgpt-mermaid-_r_1kll_ .node ellipse,#chatgpt-mermaid-_r_1kll_ .node polygon,#chatgpt-mermaid-_r_1kll_ .node path{fill:rgb(26, 40, 61);stroke:rgb(31, 78, 148);stroke-width:1px;}#chatgpt-mermaid-_r_1kll_ .rough-node .label text,#chatgpt-mermaid-_r_1kll_ .node .label text,#chatgpt-mermaid-_r_1kll_ .image-shape .label,#chatgpt-mermaid-_r_1kll_ .icon-shape .label{text-anchor:middle;}#chatgpt-mermaid-_r_1kll_ .node .katex path{fill:#000;stroke:#000;stroke-width:1px;}#chatgpt-mermaid-_r_1kll_ .rough-node .label,#chatgpt-mermaid-_r_1kll_ .node .label,#chatgpt-mermaid-_r_1kll_ .image-shape .label,#chatgpt-mermaid-_r_1kll_ .icon-shape .label{text-align:center;}#chatgpt-mermaid-_r_1kll_ .node.clickable{cursor:pointer;}#chatgpt-mermaid-_r_1kll_ .root .anchor path{fill:rgba(255, 255, 255, 0.498)!important;stroke-width:0;stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kll_ .arrowheadPath{fill:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kll_ .edgePath .path{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;}#chatgpt-mermaid-_r_1kll_ .flowchart-link{stroke:rgba(255, 255, 255, 0.498);fill:none;}#chatgpt-mermaid-_r_1kll_ .edgeLabel{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1kll_ .edgeLabel p{background-color:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kll_ .edgeLabel rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kll_ .labelBkg{background-color:rgba(24, 24, 24, 0.5);}#chatgpt-mermaid-_r_1kll_ .cluster rect{fill:rgba(54, 54, 54, 0.96);stroke:rgba(255, 255, 255, 0.082);stroke-width:1px;}#chatgpt-mermaid-_r_1kll_ .cluster text{fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kll_ .cluster span{color:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kll_ div.mermaidTooltip{position:absolute;text-align:center;max-width:200px;padding:2px;font-family:-apple-system,"system-ui","Segoe UI",sans-serif;font-size:12px;background:rgba(54, 54, 54, 0.96);border:1px solid rgba(255, 255, 255, 0.082);border-radius:2px;pointer-events:none;z-index:100;}#chatgpt-mermaid-_r_1kll_ .flowchartTitleText{text-anchor:middle;font-size:18px;fill:rgb(255, 255, 255);}#chatgpt-mermaid-_r_1kll_ rect.text{fill:none;stroke-width:0;}#chatgpt-mermaid-_r_1kll_ .icon-shape,#chatgpt-mermaid-_r_1kll_ .image-shape{background-color:rgb(24, 24, 24);text-align:center;}#chatgpt-mermaid-_r_1kll_ .icon-shape p,#chatgpt-mermaid-_r_1kll_ .image-shape p{background-color:rgb(24, 24, 24);padding:2px;}#chatgpt-mermaid-_r_1kll_ .icon-shape .label rect,#chatgpt-mermaid-_r_1kll_ .image-shape .label rect{opacity:0.5;background-color:rgb(24, 24, 24);fill:rgb(24, 24, 24);}#chatgpt-mermaid-_r_1kll_ .label-icon{display:inline-block;height:1em;overflow:visible;vertical-align:-0.125em;}#chatgpt-mermaid-_r_1kll_ .node .label-icon path{fill:currentColor;stroke:revert;stroke-width:revert;}#chatgpt-mermaid-_r_1kll_ .node .neo-node{stroke:rgb(31, 78, 148);}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].node rect,#chatgpt-mermaid-_r_1kll_ [data-look="neo"].cluster rect,#chatgpt-mermaid-_r_1kll_ [data-look="neo"].node polygon{stroke:url(#chatgpt-mermaid-_r_1kll_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].swimlane.cluster rect{filter:none;}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].node path{stroke:url(#chatgpt-mermaid-_r_1kll_-gradient);stroke-width:1px;}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].node .outer-path{filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].node .neo-line path{stroke:rgb(31, 78, 148);filter:none;}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].node circle{stroke:url(#chatgpt-mermaid-_r_1kll_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].node circle .state-start{fill:#000000;}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].icon-shape .icon{fill:url(#chatgpt-mermaid-_r_1kll_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kll_ [data-look="neo"].icon-shape .icon-neo path{stroke:url(#chatgpt-mermaid-_r_1kll_-gradient);filter:drop-shadow( 1px 2px 2px rgba(185,185,185,1));}#chatgpt-mermaid-_r_1kll_ .node text{font-size:14px;font-weight:600;letter-spacing:normal;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1kll_ .edgeLabels text{font-size:13px;font-weight:600;letter-spacing:-0.08px;fill:rgb(153, 206, 255);}#chatgpt-mermaid-_r_1kll_ .node tspan[font-weight="normal"],#chatgpt-mermaid-_r_1kll_ .edgeLabels tspan[font-weight="normal"]{font-weight:600;}#chatgpt-mermaid-_r_1kll_ .edgeLabel .label rect{opacity:1;rx:13px;ry:13px;fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-width:1px;}#chatgpt-mermaid-_r_1kll_ .node rect,#chatgpt-mermaid-_r_1kll_ .node circle,#chatgpt-mermaid-_r_1kll_ .node ellipse,#chatgpt-mermaid-_r_1kll_ .node polygon,#chatgpt-mermaid-_r_1kll_ .node path{fill:rgb(0, 40, 77);stroke:rgba(255, 255, 255, 0.1);stroke-width:1px;}#chatgpt-mermaid-_r_1kll_ .node rect{rx:16px;ry:16px;}#chatgpt-mermaid-_r_1kll_ .node.mermaid-decision .label-container{fill:rgb(0, 14, 26);stroke:rgb(26, 62, 95);stroke-dasharray:2,2;}#chatgpt-mermaid-_r_1kll_ .edgePaths .flowchart-link{stroke:rgba(255, 255, 255, 0.498);stroke-width:1px;stroke-linecap:round;stroke-linejoin:round;}#chatgpt-mermaid-_r_1kll_ .marker{fill:rgba(255, 255, 255, 0.498);stroke:rgba(255, 255, 255, 0.498);}#chatgpt-mermaid-_r_1kll_ :root{--mermaid-font-family:-apple-system,"system-ui","Segoe UI",sans-serif;}AWS Cloud - us-east-1VPC10.0.0.0/16Public Subnet10.0.1.0/24Security GroupHTTP :80 → InternetSSH :22 → Admin IPEC2t4g.microUbuntu 24.04NginxPort 80index.htmlHello, World!IAM RoleS3 BucketInternet UserInternet Gateway




31. Final Deliverables
The project successfully demonstrates:
Infrastructure
- AWS VPC
- Public subnet
- Internet Gateway
- Route table
- Security Group
- IAM role
- EC2 instance
- S3 bucket
Automation
- Terraform Infrastructure as Code
- Ansible configuration management
- Automated Nginx installation
- Automated webpage deployment
Application
- Ubuntu 24.04
- Nginx
- HTML webpage
- Public HTTP access
Repository
GitHub repository:
jay-mundo/devops-code-challenge3
Live application
Hello World Web Application
32. Project Status
Component	Status
AWS VPC	✅ Complete
Public Subnet	✅ Complete
Internet Gateway	✅ Complete
Route Table	✅ Complete
Security Group	✅ Complete
IAM Role	✅ Complete
S3 Bucket	✅ Complete
EC2 Instance	✅ Complete
SSH Access	✅ Verified
Ansible Inventory	✅ Complete
Ansible Connectivity	✅ Verified
Nginx	✅ Installed
Webpage	✅ Deployed
Public HTTP Access	✅ Verified
Terraform Validation	✅ Passed
Terraform Plan	✅ No Changes
GitHub Repository	✅ Pushed
Documentation	✅ Complete


Final Takeaway
This project demonstrates the fundamental workflow of a cloud engineer:
Write Infrastructure as Code
            ↓
       Terraform
            ↓
     Build AWS Resources
            ↓
        EC2 Server
            ↓
          SSH
            ↓
         Ansible
            ↓
    Configure the Server
            ↓
         Install Nginx
            ↓
      Deploy Web Page
            ↓
      Public Application

The most important concept learned from this challenge is:
Terraform builds the infrastructure. Ansible configures the infrastructure.

Together, they create a repeatable and automated deployment process that is much more reliable than manually configuring servers through the AWS Console.
Project Completed 🚀
AWS DevOps Code Challenge 3 — Infrastructure as Code with Terraform and Ansible
Terraform → AWS → EC2 → Ansible → Nginx → Hello World
=======
# 1. The 60-Second Summary

I built a simple **"Hello, World!" web server** on AWS and automated the entire infrastructure and server configuration using **Terraform and Ansible**.

The website itself is intentionally simple.

The real project is everything around it:

| Goal | How it was achieved |
|---|---|
| Create cloud infrastructure | **Terraform** |
| Create an isolated AWS network | **Amazon VPC** |
| Create a cloud server | **Amazon EC2** |
| Control network traffic | **Security Group** |
| Give EC2 an AWS identity | **IAM Role** |
| Create object storage | **Amazon S3** |
| Configure the Linux server automatically | **Ansible** |
| Install a web server | **Nginx** |
| Deploy the webpage | **Ansible** |
| Make the website publicly accessible | **EC2 Public IP + HTTP** |
| Avoid manual AWS configuration | **Infrastructure as Code** |

### The complete automation flow

```mermaid
flowchart LR
    A["Developer writes Terraform code"] --> B["Terraform provisions AWS"]
    B --> C["EC2 Ubuntu server"]
    C --> D["Ansible connects over SSH"]
    D --> E["Install Nginx"]
    E --> F["Deploy index.html"]
    F --> G["Hello, World!"]
>>>>>>> bb4d78c (Expand Challenge 3 documentation)
