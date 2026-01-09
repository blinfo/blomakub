#!/bin/bash

set -e

# Install IntelliJ IDEA Community Edition via JetBrains Toolbox or direct download
cd /tmp

# Download latest IntelliJ IDEA Community Edition
echo "Downloading IntelliJ IDEA Community Edition..."
IDEA_VERSION=$(curl -s "https://data.services.jetbrains.com/products/releases?code=IIC&latest=true" | grep -o '"version":"[^"]*' | head -1 | cut -d'"' -f4)
wget -O ideaIC.tar.gz "https://download.jetbrains.com/idea/ideaIC-${IDEA_VERSION}.tar.gz"

# Extract and install
echo "Installing IntelliJ IDEA Community Edition..."
tar -xzf ideaIC.tar.gz
sudo mv idea-IC-* /opt/intellij-idea-community

# Create desktop entry
sudo tee /usr/share/applications/intellij-idea-community.desktop > /dev/null << EOF
[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA Community Edition
Icon=/opt/intellij-idea-community/bin/idea.svg
Exec="/opt/intellij-idea-community/bin/idea.sh" %f
Comment=Capable and Ergonomic IDE for JVM
Categories=Development;IDE;
Terminal=false
StartupWMClass=jetbrains-idea-ce
StartupNotify=true
EOF

# Create symlink for command line usage
sudo ln -sf /opt/intellij-idea-community/bin/idea.sh /usr/local/bin/idea

# Cleanup
rm ideaIC.tar.gz
cd -

echo "IntelliJ IDEA Community Edition installed successfully!"
echo "You can launch it from the applications menu or run 'idea' from the command line."