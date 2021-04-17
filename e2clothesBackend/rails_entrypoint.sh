#!/bin/bash
set -e

# Clean environment
if [ -f ./tmp/pids/server.pid ]; then
  echo -e "\nCleaning environment"
  rm ./tmp/pids/server.pid
fi
# Install dependencies
echo -e "\nChecking gems"
bundle install --quiet


# Initialize database if it's required
if [ ! -f /app/api/tmp/db.sem ]; then
  echo -e "\nSetup database"
  /app/api/bin/rake db:setup
  echo -e "\nRunning migrations"
  /app/api/bin/rake db:migrate
  touch /app/api/tmp/db.sem
fi

# Run!
echo -e "\nRunning server"
exec "$@"
