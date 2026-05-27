#!/bin/bash

if [ -f "backend.pid" ]; then
  PID=$(cat backend.pid)
  echo "Stopping backend (PID: $PID)..."
  kill $PID || true
  rm backend.pid
  echo "Backend stopped."
else
  echo "backend.pid not found. Looking for process on port 8080..."
  PID=$(lsof -t -i:8080)
  if [ -n "$PID" ]; then
    echo "Found process on port 8080. Stopping (PID: $PID)..."
    kill $PID || true
    echo "Backend stopped."
  else
    echo "No backend running."
  fi
fi
