#!/usr/bin/env bash
# set -e
# mkdir -p /srv/app
#!/bin/bash
set -e

# Update system packages
yum update -y

# Install npm
dnf -y module enable nodejs:20 || true
dnf -y install nodejs

# Install MongoDB Community Edition
if ! command -v mongod &> /dev/null; then
    cat > /etc/yum.repos.d/mongodb-org-8.0.repo << 'EOF'
[mongodb-org-8.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2023/mongodb-org/8.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-8.0.asc
EOF
    yum install -y mongodb-org
fi

# Start and enable MongoDB service
systemctl start mongod
systemctl enable mongod

dnf -y install socat