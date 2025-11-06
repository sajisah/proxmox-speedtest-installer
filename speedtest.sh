#!/bin/bash

echo "======================================================"
echo "   Ookla Speedtest CLI Installer for Proxmox"
echo "   Developed by vchcloud.in"
echo "   Vortexia R&D (India) Private Ltd"
echo "======================================================"
echo ""

# Confirmation prompt
read -p "Do you want to download and install Speedtest CLI? (yes/no): " choice

case "$choice" in
  yes|Yes|y|Y )
    echo "✔ Installation starting..."
    ;;
  no|No|n|N )
    echo "❌ Installation cancelled."
    exit 0
    ;;
  * )
    echo "Invalid input. Please type yes or no."
    exit 1
    ;;
esac

echo ""
echo "📥 Downloading Speedtest CLI (using bypass User-Agent)..."
wget --user-agent="Mozilla/5.0" \
  https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz \
  -O speedtest.tgz

# Validate download
if [ ! -f speedtest.tgz ]; then
    echo "❌ Download failed! Please check internet or region restrictions."
    exit 1
fi

echo "📦 Extracting package..."
tar -xvzf speedtest.tgz

if [ ! -f speedtest ]; then
    echo "❌ Extraction failed! 'speedtest' binary not found."
    exit 1
fi

echo "⚙ Installing Speedtest CLI..."
sudo mv speedtest /usr/local/bin/
sudo chmod +x /usr/local/bin/speedtest

echo "🧹 Cleaning up..."
rm -f speedtest.tgz
rm -f speedtest.md 2>/dev/null

echo ""
echo "✅ Installation complete!"
echo "Run the command below to test:"
echo ""
echo "    speedtest"
echo ""
echo "------------------------------------------------------"
echo " Script by vchcloud.in"
echo " Vortexia R&D (India) Private Ltd"
echo "------------------------------------------------------"
