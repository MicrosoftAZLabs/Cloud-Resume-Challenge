# Cloud-Resume-Challenge

The goal of this [Cloud resume challenge](https://cloudresumechallenge.dev/docs/the-challenge/azure/) was to build a resume online. Since I recently complete my AZ103 & AZ305 certification. I decided to take this challenge on as a way to bolster up my Azure skills. Working on a project is the best way to build once skills. You often run into problems or challenges that google your way out :) by diving deeper into the technology, thereby building knowledge.

I have mainly used this challenge as a guiding path for myself and made some modification along the way. E.g. Instead of using Python for the Azure Function, I have used C#. Also I used the HTML template from [styleshout](https://www.styleshout.com/). Below is a high level architecture view of the what I have build along the way. For more details description, please follow the readme.md inside the folder structure.

If you find the repo useful, please hit the :star:


## Resume - Architecture

![image](https://user-images.githubusercontent.com/49052348/194770077-e69158a2-ab6b-48f0-b943-2ab9b09755e3.png)




## Folder Structure
- .github/workflows
  1. CI/CD files are in the workflow directory

- StaticWebsite folder 
  1. Contains the Website.
  2. `main.js` contains visitor counter code.
  
- StaticWebsiteViewCounter
  1. Api which connects with cosmos DB to fetch visitor count 
  2. Tests for Api

- Terraform
  1. frontend- Terraform files to create Azure infra for the Static website.
  2. backkend- Terrafrom files to create a function app with cosmos db.
  3. backend.sh- Create Storage Account and Blob Container for the terraform state for frontend & backend.


