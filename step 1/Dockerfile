# Use Ubuntu 22.04 as base image
FROM ubuntu:22.04

# Update with last patch and install dependencies
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get upgrade -y

# Add non-root user energi
RUN useradd -s /bin/bash energi
USER energi
WORKDIR /home/energi

# Download the Energi Node. It would be nice to pass version via env parameter
ARG VERSION="v1.1.7"
RUN curl -L -O "https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/$VERSION/energi3-$VERSION-linux-amd64.tgz"
RUN curl -L -O "https://s3-us-west-2.amazonaws.com/download.energi.software/releases/energi3/$VERSION/SHA256SUMS"

# Run checksum
RUN SHA=`sha256sum energi3-$VERSION-linux-amd64.tgz | awk {'print $1'}`
RUN VERIFY=`grep energi3-$VERSION-linux-amd64.tgz SHA256SUMS | awk {'print $1'}`
RUN if [ "$SHA" != "$VERIFY" ]; then echo "Checksum failed!" && exit 1; fi

# Extract binary
RUN tar xvf "energi3-$VERSION-linux-amd64.tgz"
RUN mv energi3-$VERSION-linux-amd64 energi

# Make the binary executable
RUN chmod +x energi/energi3

# Expose the required port
EXPOSE 39797

# Run binary
CMD ["./energi/energi3"]
