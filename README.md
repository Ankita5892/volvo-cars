Prerequisites:

Public Cloud: AWS
IaC: Terraform
Containerization: Docker, Docker Hub (for artifact storage)
CI/CD: GitHub Actions

This is a JavaScript application deployed on an AWS EC2 instance. The infrastructure is created using Terraform, consisting of three modules: VPC, subnet, and EC2. A Dockerfile is written to build the JavaScript image, which runs on port 8080. The application is hosted on the EC2 instance created by Terraform, and GitHub Actions utilizes a self-hosted runner to deploy this application.

In the CI stage, continuous integration is performed, where Docker login is configured using a repository secret variable, and the image is built. In the CD stage, the job is triggered once CI is completed. In the CD stage, the image is pulled from Docker Hub, the old container with the same name is deleted, and a new container is run on port 8080.

GitHub Repository : https://github.com/Ankita5892/volvo-cars
App Endpoint : http://ec2-52-16-7-158.eu-west-1.compute.amazonaws.com:8080/

You can fork the repository and modify the JavaScript code to test CI and CD. Once you push your changes, the CI job will trigger, and once CI is completed, the CD job will trigger under Actions. Please check the grammar in the paragraph.

