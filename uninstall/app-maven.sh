#!/bin/bash

set -e

echo "Uninstalling Maven..."

# Remove Maven via mise
if command -v mise &> /dev/null; then
    mise uninstall maven || true
    echo "Maven removed from mise"
fi

# Remove Maven settings.xml (backup first if it exists and has custom content)
if [ -f ~/.m2/settings.xml ]; then
    if grep -q "blinfo-repo" ~/.m2/settings.xml; then
        echo "Removing Maven settings.xml with BL Info repository configuration"
        rm ~/.m2/settings.xml
    else
        echo "Maven settings.xml contains custom configuration, backing up to settings.xml.backup"
        mv ~/.m2/settings.xml ~/.m2/settings.xml.backup
    fi
fi

# Remove .m2 directory if it's empty
if [ -d ~/.m2 ] && [ -z "$(ls -A ~/.m2)" ]; then
    rmdir ~/.m2
    echo "Removed empty .m2 directory"
fi

echo "Maven uninstall complete!"