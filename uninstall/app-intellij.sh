#!/bin/bash

set -e

echo "Uninstalling IntelliJ IDEA Community Edition..."

# Remove installation directory
if [ -d /opt/intellij-idea-community ]; then
    sudo rm -rf /opt/intellij-idea-community
    echo "Removed IntelliJ IDEA installation directory"
fi

# Remove desktop entry
if [ -f /usr/share/applications/intellij-idea-community.desktop ]; then
    sudo rm /usr/share/applications/intellij-idea-community.desktop
    echo "Removed desktop entry"
fi

# Remove command line symlink
if [ -L /usr/local/bin/idea ]; then
    sudo rm /usr/local/bin/idea
    echo "Removed command line symlink"
fi

# Remove user configuration (optional - user may want to keep settings)
if [ -d ~/.config/JetBrains ]; then
    echo "IntelliJ IDEA user configuration found at ~/.config/JetBrains"
    echo "Remove manually if you want to delete all settings and plugins"
fi

if [ -d ~/.local/share/JetBrains ]; then
    echo "IntelliJ IDEA user data found at ~/.local/share/JetBrains"
    echo "Remove manually if you want to delete all caches and logs"
fi

echo "IntelliJ IDEA Community Edition uninstall complete!"