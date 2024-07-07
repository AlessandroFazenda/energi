# Step 1:

*Docker Whale*: Write a Dockerfile to run Energi Node in a container. It should somehow verify the checksum of the downloaded release (there's no need to build the project), run as a normal user, it should run the client, and print its output to the console.
https://wiki.energi.world/en/downloads/core-node
The build should be security conscious, and ideally pass a container image security test such as ECR, or Trivy.