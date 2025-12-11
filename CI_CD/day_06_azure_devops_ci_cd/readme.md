# Task 1: Terraform Deployment Using Azure DevOps
- Create Terraform configuration that deploys
    - Resource Groups
    - App Service
    - App Service Plan
- Keep all values inside pipeline variables
- Set up a CI pipeline that:
    - Installs Terraform
    - Authenticates to Azure inside the pipeline
    - Runs Terraform init, fmt, and validate
    - Make validation behave differently based on environment:
        - If environment is prod → run strict validation and fail on warnings
        - If environment is dev → allow warnings and continue
    - Generates a Terraform plan
    - Publishes the plan as a pipeline artifact
- Set up a CD pipeline that:
    - Authenticates to Azure again inside the pipeline
    - Downloads the plan artifact
    - Pauses for manual approval before applying changes
    - Runs Terraform apply to deploy the resources
- Verify the deployment in the selected environment
 
## Steps:
1. Create a repo and push the terraform code
2. Clone it into Azure Devops Repo
3. Setup Managed Identity and link it to Azure Devops Settings -> Pipeline -> Service Connections 
4. Add Self hosted Agent in Settings -> Pipeline -> Agent Pools -> Default
- https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/linux-agent?view=azure-devops&tabs=IP-V4
- https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/personal-access-token-agent-registration?view=azure-devops
5. Install terraform extension from Marketplace


# Task 2: Deploy an Application to Azure App Service Using Marketplace Tasks
- Push a sample application to Azure Repos
- Create a CI pipeline that:
    - Restores dependencies
    - Builds the application
    - Packages it and publishes the artifact
- Create a CD pipeline that:
    - Authenticates to Azure inside the pipeline
    - Uses variables for configuration, environment, and deployment parameters
    - Downloads the artifact from CI
    - Deploys the application to Azure App Service using the App Service Deploy Marketplace task
    - Includes a pre-deployment approval before deploying to higher environments
    - After deployment, verify the application is accessible via the App Service URL