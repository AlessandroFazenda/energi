# Step 3:

*All the continuouses*: Write a simple build and deployment pipeline for the above using groovy / Jenkinsfile, Travis CI or Gitlab CI.

# What Jenkinsfile file does:
- Build the docker image `energi3:latest` locate at `/repo/files/`.
- Run trivy on image.
- Deploy it using kubernetes usign yaml file locate at `/repo/files/`.

# Import notes:
- The jenkins agent running it is same that the server.
- This pipeline assumes all required software are already installed on Jenkins agent.

# References:
- I copied the template file from a Jenkins course I take on Udemy.