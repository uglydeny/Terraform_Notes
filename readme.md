# 🚀 Terraform Fundamentals & Azure Resource Group Deployment

This repository contains Terraform fundamentals, architecture concepts, workflow explanations, and a practical example of creating an Azure Resource Group using Terraform.

---

# 📌 What is Terraform??

Terraform is an **Infrastructure as Code (IaC)** tool developed by **HashiCorp** that allows developers and cloud engineers to provision, manage, and automate infrastructure using code instead of manually creating resources through cloud portals.

Terraform supports multiple cloud providers such as:

- Microsoft Azure
- Amazon Web Services (AWS)
- Google Cloud Platform (GCP)
- Kubernetes
- GitHub
- VMware
- Datadog
- And many more

---

# 🏗 Infrastructure Creation Approaches

## 1. ClickOps (Manual)

Resources are created manually using cloud portals.

### Examples

- Azure Portal
- AWS Console
- GCP Console

### Drawbacks

- Time consuming
- Human errors
- Difficult to scale
- No version control
- Repetitive work

---

## 2. Automation

Infrastructure is created using commands or code.

### Imperative Approach

You tell the cloud **how to perform every step**.

Example:

```bash
az group create \
--name my-rg \
--location eastus
```

### Declarative Approach

You tell the cloud **what you want** and the tool handles the implementation.

Example:

```hcl
resource "azurerm_resource_group" "rg" {
  name     = "my-rg"
  location = "eastus"
}
```

Terraform follows the **Declarative Model**.

---

# ☁ Cloud Native IaC Tools

| Cloud Provider | Imperative Tool | Declarative Tool |
|---------------|----------------|-----------------|
| Azure | Azure CLI | ARM Templates / Bicep |
| AWS | AWS CDK | CloudFormation |
| GCP | Google Cloud SDK | Deployment Manager |

---

# 🎯 Why Terraform?

Every cloud provider has its own Infrastructure as Code solution.

| Cloud | Native IaC Tool |
|---------|---------|
| Azure | ARM / Bicep |
| AWS | CloudFormation |
| GCP | Deployment Manager |

Terraform provides:

✅ Multi-cloud support

✅ Single language (HCL)

✅ Reusable infrastructure

✅ Faster deployments

✅ Version control integration

✅ Infrastructure consistency

---

# 🔥 Terraform Features

- Infrastructure as Code (IaC)
- Declarative Configuration
- Multi-cloud Support
- State Management
- Resource Dependency Management
- Reusable Modules
- Version Control Friendly
- Open Source
- Command Line Interface (CLI)

---

# 🧱 Terraform Architecture

```text
Terraform Code
      │
      ▼
 Terraform CLI
      │
      ▼
   Provider
      │
      ▼
 Cloud Platform
```

---

## Providers

Providers act as a bridge between Terraform and cloud services.

### Azure Provider

```hcl
provider "azurerm" {
  features {}
}
```

### AWS Provider

```hcl
provider "aws" {
}
```

### GCP Provider

```hcl
provider "google" {
}
```

---

# 📝 Terraform Configuration Language (HCL)

Terraform uses:

**HashiCorp Configuration Language (HCL)**

Example:

```hcl
name = "resource-group"
```

---

# 📦 Types of Terraform Blocks

## Block Without Label

```hcl
terraform {

}
```

---

## Block With One Label

```hcl
provider "azurerm" {

}
```

---

## Block With Two Labels

```hcl
resource "azurerm_resource_group" "rg" {

}
```

---

# ⚙ Terraform Block

Used to define provider requirements.

```hcl
terraform {

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

  }

}
```

---

## Explanation

### Source

```hcl
source = "hashicorp/azurerm"
```

Specifies where Terraform should download the provider from.

### Version

```hcl
version = "~> 3.0"
```

Locks the provider version to avoid unexpected behavior.

---

# 🔌 Provider Block

The provider block initializes communication with the cloud platform.

```hcl
provider "azurerm" {
  features {}
}
```

### Purpose

- Authenticate with Azure
- Connect to Azure Resource Manager
- Enable resource provisioning

---

# 🏢 Resource Block

The resource block creates actual cloud resources.

Example:

```hcl
resource "azurerm_resource_group" "rg" {

  name     = "rg-terraform"

  location = "eastus"

}
```

### Components

| Component | Description |
|------------|------------|
| resource | Terraform keyword |
| azurerm_resource_group | Resource type |
| rg | Local name |
| name | Actual Azure resource name |
| location | Azure region |

---

# 📂 Project Structure

```text
terraform-project/
│
├── main.tf
├── providers.tf
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── README.md
```

---

# 🚀 Terraform Workflow

## Step 1: Initialize Terraform

```bash
terraform init
```

Downloads required providers and initializes the working directory.

Creates:

```text
.terraform/
.terraform.lock.hcl
```

---

## Step 2: Format Terraform Code

```bash
terraform fmt
```

Automatically formats Terraform files.

---

## Step 3: Validate Configuration

```bash
terraform validate
```

Checks:

- Syntax errors
- Required arguments
- Configuration validity

Output:

```bash
Success! The configuration is valid.
```

---

## Step 4: Preview Infrastructure Changes

```bash
terraform plan
```

Displays:

- Resources to create
- Resources to update
- Resources to destroy

No changes are made at this stage.

---

## Step 5: Deploy Infrastructure

```bash
terraform apply
```

Creates actual cloud resources.

Example:

```bash
terraform apply -auto-approve
```

---

## Step 6: Destroy Infrastructure

```bash
terraform destroy
```

Removes all resources managed by Terraform.

---

# 📊 Terraform State File

Terraform maintains a state file:

```text
terraform.tfstate
```

The state file stores:

- Resource IDs
- Metadata
- Current infrastructure state

Terraform compares:

```text
Desired State
     VS
Current State
```

and determines required actions.

---

# 🔄 Terraform Command Flow

## terraform init

1. Read `.tf` files
2. Identify required providers
3. Download providers
4. Create `.terraform` directory
5. Generate lock file

---

## terraform fmt

1. Read `.tf` files
2. Remove unnecessary spaces
3. Apply standard formatting

---

## terraform validate

1. Read configuration
2. Verify syntax
3. Verify required arguments
4. Confirm configuration validity

---

## terraform plan

1. Read configuration
2. Read state file
3. Authenticate with cloud
4. Compare desired and actual infrastructure
5. Generate execution plan

---

## terraform apply

1. Read configuration
2. Read state file
3. Compare infrastructure
4. Display execution plan
5. Request approval
6. Create/update resources
7. Update state file

---

# 📋 Common Terraform Commands

| Command | Purpose |
|----------|----------|
| terraform init | Initialize Terraform |
| terraform fmt | Format Terraform code |
| terraform validate | Validate configuration |
| terraform plan | Preview infrastructure changes |
| terraform apply | Create or modify resources |
| terraform destroy | Delete resources |
| terraform show | Display current state |
| terraform output | Show output values |
| terraform state list | List resources in state |

---

# 💻 Example: Azure Resource Group Deployment

```hcl
terraform {

  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

  }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {

  name     = "rg-terraform"

  location = "eastus"

}
```

---

# 🎓 Interview Questions

### What is Terraform?

Terraform is an Infrastructure as Code tool used to provision and manage infrastructure across multiple cloud platforms using declarative HCL configuration files.

---

### What is a Provider?

A provider is a plugin that enables Terraform to interact with APIs of cloud providers and services.

---

### What is a State File?

The Terraform state file stores information about managed infrastructure so Terraform can track and manage resources efficiently.

---

### Difference Between terraform plan and terraform apply?

| terraform plan | terraform apply |
|---------------|---------------|
| Preview changes | Execute changes |
| No resource creation | Creates resources |
| Safe review stage | Actual deployment |

---

### Difference Between Imperative and Declarative?

| Imperative | Declarative |
|------------|------------|
| How to perform tasks | Desired end state |
| Step-by-step instructions | Desired configuration |
| Azure CLI | Terraform |

---

# 📚 Learning Outcome

After completing this project, you will understand:

- Infrastructure as Code (IaC)
- Terraform Architecture
- Providers
- Resource Blocks
- Terraform Workflow
- State Management
- Azure Resource Deployment
- Multi-cloud Infrastructure Automation

---

## ⭐ If you found this repository helpful, consider giving it a star!