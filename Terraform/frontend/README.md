
# Terraform Configuration for setting up Static website


## Terraform Backend
Terraform stores state about managed infrastructure to map real-world resources to the configuration, keep track of metadata, and improve performance. Terraform stores this state in a local file by default, but you can also use a Terraform remote [backend](https://www.terraform.io/language/settings/backends/configuration) to store state remotely.

There are two steps to configuring the Backend.

* Creating a Storage Account and Blob Container for the terraform state
* Include Backend Block in the Terraform scripts and run the command `terraform init`



First, login to the Azure CLI using `az login`. Then, execute the following `sh backend.sh` script or copy paste the command in the Azure Cloud shell.
Similar to the one shown below:

![image](https://user-images.githubusercontent.com/49052348/194079894-dc443941-01bd-40f2-9da3-06590a8446b2.png)


*Ensure that the names mentioned while creating the ResourceGroup; Storage Account; Blob Storage are correctly updated in the Backend.tf file*

