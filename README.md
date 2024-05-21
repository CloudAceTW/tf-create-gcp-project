# How to use

## Permissions
In order to execute this module you must have a Service Account with the following roles:

- roles/resourcemanager.folderViewer on the folder that you want to create the project in
- roles/resourcemanager.organizationViewer on the organization
- roles/resourcemanager.projectCreator on the organization
- roles/billing.user on the organization

## Setup
With GCP service account
```
export GOOGLE_APPLICATION_CREDENTIALS=<SERVICE_ACCOUNT_FILE_PATH>
```

Or use gcloud
```
gcloud auth application-default login
```

Copy and modify tf vars
```
cp my.tfvars.example my.tfvars
```
modify `my.tfvars` as need

## Terraform
**Important:**
**This project uses Terraform without a remote backend. The infrastructure state is stored locally in the `.terraform` directory and `terraform.tfstate`.**


Init to install the dependencies
```
terraform init
```

Plan to check the changes
```
terraform plan -var-file=my.tfvars
```

Apply to execute
```
terraform apply -var-file=my.tfvars
```
