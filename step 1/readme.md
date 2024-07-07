# Step 1:

*Docker Whale*: Write a Dockerfile to run Energi Node in a container. It should somehow verify the checksum of the downloaded release (there's no need to build the project), run as a normal user, it should run the client, and print its output to the console.
https://wiki.energi.world/en/downloads/core-node
The build should be security conscious, and ideally pass a container image security test such as ECR, or Trivy.

# What Dockerfile does:
- Use Ubuntu 22.04 as base image
- Update with last patch and install curl
- Add non-root user energi
- Download the Energi Node. TODO: pass version via env parameter
- Run checksum. If different, abort it!
- Extract binary
- Make the binary executable
- Expose the required port
- Run binary

# How to use:
- Build the container: `docker build -t energi3:latest .`
- Run trivy: `trivy image energi3:latest`


# References:
- https://medium.com/@maheshwar.ramkrushna/scanning-docker-images-for-vulnerabilities-using-trivy-for-effective-security-analysis-fa3e2844db22