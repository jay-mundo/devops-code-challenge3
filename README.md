# AWS Cloud Engineering Tech Challenge 3
## Infrastructure as Code with Terraform and Ansible

![AWS](https://img.shields.io/badge/AWS-Cloud-orange)
![Terraform](https://img.shields.io/badge/Terraform-Infrastructure%20as%20Code-purple)
![Ansible](https://img.shields.io/badge/Ansible-Configuration%20Management-red)
![Nginx](https://img.shields.io/badge/Nginx-Web%20Server-green)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04-orange)

---

## 📌 Project Overview

This project demonstrates how to use **Terraform** and **Ansible** together to automatically build and configure a web server in Amazon Web Services (AWS).

The goal of this challenge was to create the required cloud infrastructure using **Terraform**, configure the server using **Ansible**, install a web server, and deploy a simple **"Hello, World!"** webpage that can be accessed from the internet.

Instead of manually logging into AWS and configuring every resource one at a time, this project uses **Infrastructure as Code (IaC)** and **Configuration Management** to make the deployment repeatable and easier to manage.

### In simple terms:

**Terraform builds the infrastructure.**

**Ansible configures the server.**

**Nginx serves the website.**

The final result is a publicly accessible webpage running on an AWS EC2 instance.

---

# 🎯 Challenge Requirements

The challenge required the following:

### Terraform

Terraform must provision:

- EC2 instance
- S3 bucket
- IAM role
- Security group
- Networking infrastructure

### Ansible

Ansible must:

- Connect to the EC2 instance
- Install and configure Nginx or Apache
- Deploy a simple webpage
- Display "Hello, World!"

### Documentation

The project must include:

- Source code
- Terraform configuration
- Ansible configuration
- README documentation
- Deployment instructions
- Explanation of the infrastructure
- GitHub repository
- Public webpage URL

---

# 🏗️ Final Architecture

The infrastructure created for this project looks like this:

```text
                         INTERNET
                            │
                            │ HTTP :80
                            ▼
                  ┌───────────────────┐
                  │   AWS Internet    │
                  │      Gateway      │
                  └─────────┬─────────┘
                            │
                            ▼
                 ┌─────────────────────┐
                 │     AWS VPC         │
                 │    10.0.0.0/16      │
                 │                     │
                 │  Public Subnet      │
                 │  10.0.1.0/24       │
                 │                     │
                 │  ┌───────────────┐  │
                 │  │ EC2 Instance  │  │
                 │  │ Ubuntu 24.04  │  │
                 │  │ ARM64         │  │
                 │  │ t4g.micro     │  │
                 │  └───────┬───────┘  │
                 │          │           │
                 └──────────┼───────────┘
                            │
                            ▼
                         NGINX
                            │
                            ▼
                    Hello, World!