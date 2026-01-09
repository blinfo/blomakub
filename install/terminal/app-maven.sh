#!/bin/bash

set -e

# Install Maven via mise
echo "Installing Maven via mise..."
mise use --global maven@latest

# Create .m2 directory if it doesn't exist
mkdir -p ~/.m2

# Create or update Maven settings.xml with custom repository
cat > ~/.m2/settings.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 
                              http://maven.apache.org/xsd/settings-1.0.0.xsd">
  
  <servers>
    <server>
      <id>blinfo-repo</id>
      <username>dev</username>
      <password>CHANGEME</password>
    </server>
  </servers>
  
  <profiles>
    <profile>
      <id>blinfo</id>
      <repositories>
        <repository>
          <id>blinfo-repo</id>
          <name>BL Info Repository</name>
          <url>https://repos.blinfo.se</url>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
      <pluginRepositories>
        <pluginRepository>
          <id>blinfo-repo</id>
          <name>BL Info Repository</name>
          <url>https://repos.blinfo.se</url>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </pluginRepository>
      </pluginRepositories>
    </profile>
  </profiles>
  
  <activeProfiles>
    <activeProfile>blinfo</activeProfile>
  </activeProfiles>
</settings>
EOF

echo "Maven installation complete!"
echo "Custom repository repos.blinfo.se configured with basic auth (user: dev)"
echo "Settings.xml created at ~/.m2/settings.xml"