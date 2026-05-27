#!/bin/bash
set -e

echo "Setting up standalone tools for dev-video-automation..."

mkdir -p tools/jdk tools/maven tools/m2

# Download JDK 17 (Temurin) if not present
if [ ! -d "tools/jdk/bin" ]; then
    echo "Downloading JDK 17..."
    curl -L "https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.11%2B9/OpenJDK17U-jdk_x64_linux_hotspot_17.0.11_9.tar.gz" -o jdk.tar.gz
    tar -xzf jdk.tar.gz -C tools/jdk --strip-components=1
    rm jdk.tar.gz
    echo "JDK 17 installed."
else
    echo "JDK 17 already exists in tools/jdk."
fi

# Download Maven 3.9.x if not present
if [ ! -d "tools/maven/bin" ]; then
    echo "Downloading Maven 3.9.6..."
    curl -L "https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz" -o maven.tar.gz
    tar -xzf maven.tar.gz -C tools/maven --strip-components=1
    rm maven.tar.gz
    echo "Maven installed."
else
    echo "Maven already exists in tools/maven."
fi

echo "Setup complete."
