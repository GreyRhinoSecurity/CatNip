#!/bin/bash

# === CatNip v3.1.1 Installer ===
REPO_URL="https://github.com/GreyRhinoSecurity/CatNip"
DEB_FILE="catnip_3.1.1_all.deb"

echo "🐾 Installing CatNip from $REPO_URL ..."
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "⬇️ Downloading latest .deb..."
wget "$REPO_URL/releases/latest/download/$DEB_FILE" -O "$DEB_FILE"

if [ ! -f "$DEB_FILE" ]; then
  echo "❌ Failed to download $DEB_FILE"
  exit 1
fi

echo "📦 Installing package..."
sudo dpkg -i "$DEB_FILE"

echo "🧹 Cleaning up..."
cd ~
rm -rf "$TEMP_DIR"

echo "✅ CatNip installed! Run it using: catnip"
