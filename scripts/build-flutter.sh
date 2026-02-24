#!/usr/bin/env bash
set -euo pipefail

# Use the stable channel (or set a tag/branch you need)
FLUTTER_CHANNEL=stable
FLUTTER_DIR="$PWD/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  echo "Cloning Flutter SDK (shallow)..."
  git clone --depth 1 https://github.com/flutter/flutter.git -b "$FLUTTER_CHANNEL" "$FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$PATH"

# Verify flutter is available
flutter --version

# Enable web and download web artifacts
flutter config --enable-web
flutter precache --web

# Install dependencies and build
flutter pub get
flutter build web --release
