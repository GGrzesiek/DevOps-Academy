# Static Website Infrastructure

This repo provisions an Azure Static Website behind Azure Front Door.

## Structure
* `modules/`: Contains reusable logic for storage and frontdoor.
* `main.tf`: Defines the Resource Group and environment logic.
* `frontdoor.tf` / `storage.tf`: Root-level module instantiations.

## Usage

**1. Initialize**
Connects to the remote backend (ensure values in production.hcl are correct).
`terraform init -backend-config=production.hcl -reconfigure`

**2. Plan**
Preview changes.
`terraform plan -var-file="production.tfvars"`

**3. Apply**
Create infrastructure.
`terraform apply -var-file="production.tfvars"`

**4. Destroy**
Cleanup.
`terraform destroy -var-file="production.tfvars"`

**5. Things to consider:**
Using terraform import first instead of creating tfstate locally?