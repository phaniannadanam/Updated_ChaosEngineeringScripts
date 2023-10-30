# Use a base image that supports package installations
FROM ubuntu:latest

# Install stress-ng
RUN apt-get update && apt-get install -y stress-ng

# Command to keep the container running (override as needed when starting the container)
CMD ["tail", "-f", "/dev/null"]
