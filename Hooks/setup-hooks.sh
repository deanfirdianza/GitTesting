#!/bin/sh

echo "🔧 Copying hook scripts to .git/hooks..."

# Use absolute paths for Windows-safe handling
cp "$(pwd)/Script/"* "$(pwd)/../.git/hooks/"

echo "🔧 Removing Windows-style line endings in allowed paths files..."

for file in "$(pwd)/AllowedPath/.allowed_paths_code" \
            "$(pwd)/AllowedPath/.allowed_paths_art" \
            "$(pwd)/AllowedPath/.allowed_paths_layout" \
            "$(pwd)/AllowedPath/.allowed_paths_anim"; do
  echo "🔍 Cleaning line endings for: $file"
  sed -i 's/\r$//' "$file"
done

echo "✅ Hooks and allowed paths cleaned and installed!"