# Cloud-Resume-Challenge

## Resume - Architecture

![image](https://user-images.githubusercontent.com/49052348/194770077-e69158a2-ab6b-48f0-b943-2ab9b09755e3.png)


Terraform
Frontend
Backend
Tests
CI/CD

## Folder Structure
- .github/workflows
  1. CI/CD files are in the workflow directory

- StaticWebsite folder 
  1. Contains the Website.
  2. `main.js` contains visitor counter code.
  
- StaticWebsiteViewCounter
  1. Api which connects with cosmos DB to fetch visitor count 

- Terraform
  1. frontend
     1. 
     2. Terraform files to create infra for the Static website.
  2. backend
     1. dummy
     2. dummy
  3. backend.sh
     1. `backend.sh` to create Storage Account and Blob Container for the terraform state.


