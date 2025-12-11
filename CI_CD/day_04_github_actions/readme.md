## Github Actions

### Task:1 Set Up Self-Hosted Runners on AWS
Create a self-hosted runner (EC2-based) in the AWS environment.
Register the runner with your GitHub repositor
Ensure the runner is online, reachable, and ready to execute workflows.

#### Steps:
1. Create a VM
2. Create a Github Repo, goto Settings -> Actions -> Runners -> Add Runner
3. Execute those commands at VM

``` sh
# Create a folder
mkdir actions-runner && cd actions-runner
# Download the latest runner package
curl -o actions-runner-linux-x64-2.329.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.329.0/actions-runner-linux-x64-2.329.0.tar.gz
# Optional: Validate the hash
echo "194f1e1e4bd02f80b7e9633fc546084d8d4e19f3928a324d512ea53430102e1d  actions-runner-linux-x64-2.329.0.tar.gz" | shasum -a 256 -c
# Extract the installer
tar xzf ./actions-runner-linux-x64-2.329.0.tar.gz
# Create the runner and start the configuration experience
$ ./config.sh --url https://github.com/hayagreevan-v/github-actions-runner --token A2S2KTL3N3TLRTOSYQGPT63JGF4QK
# Last step, run it!
$ ./run.sh
```

4. Create Github Action Workflow yaml at .github/workflows/main.yml

``` yml    
name: runner-demo
on:
  workflow_dispatch:

jobs:
  build:
    runs-on: self-hosted

    steps:
      - name: demo
        run: echo "Running on runner"
```
 
### Task:2 Create an S3 Bucket Pipeline Using GitHub Actions
 
Using a GitHub Actions YAML workflow use Self-Hosted Runners
Create an S3 bucket through the pipeline.
After creating the bucket, upload a file from a specific directory in the same repo.
Code changes should only be done in feature branch.
Once the feature branch is merged into main, the workflow should trigger and run the process.
Try assigning IAM role to the runner and deploy the S3.


1. Install AWS CLI on VM
2. Add IAM Role with S3 Access to VM
3. Update main.yml

``` yml
name: runner-demo
on:
  pull_request:
    types: 
      - closed
    branches: 
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: self-hosted

    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Verify AWS identity (instance role)
        run: aws sts get-caller-identity

      - name: Create s3 bucket
        run: aws s3 mb s3://hex-github-actions-bucket

      - name: Upload files to s3
        run: aws s3 cp upload/ s3://hex-github-actions-bucket/upload/ --recursive
        
      - name: Check files at s3
        run: aws s3 ls s3://hex-github-actions-bucket/upload/ --recursive
        
```