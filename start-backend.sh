#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: ./start-backend.sh <project-name>"
  exit 1
fi

PROJECT=$1
PROJECT_DIR="projects/$PROJECT"

if [ ! -d "$PROJECT_DIR" ]; then
  echo "Error: Project directory $PROJECT_DIR does not exist."
  exit 1
fi

echo "Starting backend for project: $PROJECT"

# Setup environment
export JAVA_HOME="$(pwd)/tools/jdk"
export PATH="$JAVA_HOME/bin:$(pwd)/tools/maven/bin:$PATH"

if [ ! -d "$JAVA_HOME/bin" ]; then
  echo "Error: JDK not found in tools/jdk. Run ./setup-tools.sh first."
  exit 1
fi

# Copy .env if it exists in root
if [ -f ".env" ]; then
  echo "Copying .env to project directory..."
  cp .env "$PROJECT_DIR/"
fi

# Determine maven settings
MAVEN_OPTS="-Dmaven.repo.local=$(pwd)/tools/m2"

cd "$PROJECT_DIR"

echo "Running Spring Boot (profile: demo)..."
# Run in background and redirect output to a log file
nohup mvn spring-boot:run -Dspring-boot.run.profiles=demo $MAVEN_OPTS > ../../spring-boot.log 2>&1 &
PID=$!
echo $PID > ../../backend.pid

echo "Backend started with PID $PID. Logs in spring-boot.log."
echo "Waiting for backend to become healthy..."
# A simple health check loop (could be made scenario-specific later)
for i in {1..30}; do
  if curl -s http://localhost:8080/ > /dev/null; then
    echo "Backend is healthy!"
    exit 0
  fi
  sleep 2
done

echo "Error: Backend did not become healthy in time. Check spring-boot.log."
exit 1
