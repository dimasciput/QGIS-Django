#!/bin/bash
# Provisioning file for Vagrant
#
# Install and configure DB
#

set -e

. /vagrant/vagrant_assets/config.sh


# DB setup
sudo su - postgres -c "dropdb ${DB_NAME} || true"
sudo su - postgres -c "createdb ${DB_NAME}"
sudo su - postgres -c "psql -c \"CREATE USER ${DB_USER} WITH PASSWORD '${DB_PASSWORD}';\" || true"
sudo su - postgres -c "psql -c \"GRANT USAGE ON SCHEMA public TO ${DB_USER};\""
sudo su - postgres -c "psql -c \"GRANT CONNECT ON DATABASE ${DB_NAME} TO ${DB_USER};\""
sudo su - postgres -c "psql -c \"GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ${DB_USER};\"";
sudo su - postgres -c "psql -c \"GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO ${DB_USER};\"";
