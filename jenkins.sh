#!/bin/bash
# USE UBUNTU 20.04 - INSTANCE: 2GB RAM + 2VCPU MIN - WILL ONLY WORK
set -e  # Exit on any error

# Update package lists
sudo apt update -y

# Install Java (required for Jenkins)
sudo apt install openjdk-17-jdk -y

# Install Maven
sudo apt install maven -y

# Add Jenkins keyring and repository
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update and install Jenkins
sudo apt update -y
sudo apt install jenkins -y

# Start Jenkins service
sudo systemctl start jenkins

# Output initial Jenkins admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
