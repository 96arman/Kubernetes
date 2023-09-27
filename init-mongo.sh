#!/bin/bash
set -e

# Vänta på att MongoDB är redo
for i in {1..30}; do
  if mongosh --host $MONGO_HOST --port $MONGO_PORT --eval "db.stats()" > /dev/null; then
    break
  fi
  echo "Väntar på att MongoDB ska starta..."
  sleep 2
done

# Anslut till MongoDB och utför några kommandon
mongosh --host $MONGO_HOST --port $MONGO_PORT <<EOF
use ToDoAppDb
db.ToDoItems.insert({ Title: 'Todo1', IsCompleted: false, Details: 'Initialize MongoDB' })
db.ToDoItems.insert({ Title: 'Todo2', IsCompleted: true, Details: 'Run Kubernetes Job' })
EOF
