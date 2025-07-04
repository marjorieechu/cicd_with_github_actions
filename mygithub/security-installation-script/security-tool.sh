#!/bin/bash

set -e

echo "Updating packages..."
sudo apt-get update -y

echo "Installing prerequisites..."
sudo apt-get install -y curl unzip gnupg lsb-release wget python3 python3-pip


# -------------------------------
#Install checkov (via pip)
# -------------------------------
echo "installing checkov..."
pip3 install --upgrade checkov

echo "checkov installa complet."
checkov --version

# If not successful then run pip3 install checkov as a root


# ---------------------------------
# Install Trivy (via official repo)
#----------------------------------
echo "Installing Trivy..."
TRIVY_VERSION=$(curl -s https://api.github.com/repos/aquasecurity/trivy/releases/latest | grep tag_name | cut -d '"' -f 4)

wget https://github.com.aquasecurity/trivy/releases/download/${TRIVY_VERSION}/trivy_${TRIVY_VERSION#v}_Linux-64bit.deb
sudo dpkg -i trivy_${TRIVY_VERSION#v}_Linux-64bit.deb
rm trivy_${TRIVY_VERSION#v}_Linux-64bit.deb

echo "trivy installation completer."
trivy --version
