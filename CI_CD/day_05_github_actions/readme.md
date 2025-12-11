
## Task 1: Build and Push a Docker Image to Docker Hub Using GitHub Hosted Runners
Create a Dockerfile based on the Nginx image and include a custom index.html page
Set up GitHub Secrets for Docker Hub authentication
Build the Docker image using GitHub Actions, tag it (latest + commit SHA), and push it to your Docker Hub repository.
Verify that the pushed image is present in DockerHub.


## Task 2: Conditional S3 Bucket Provisioning and File Upload
Pass the bucket name and environment (prod/dev/stage) from pipeline/environment variables
Create an S3 bucket only if it does not already exist (if it does, skip this step and continue)
If the environment is prod, create the bucket with versioning enabled. Otherwise, create it without versioning
After the bucket is created, upload the files to it
