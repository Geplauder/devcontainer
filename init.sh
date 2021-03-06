#!/bin/bash

echo "Initializing repositories..."

if [ ! -d "./ferrum/.git" ]; then
	echo "Ferrum not found, cloning..."

	rm -r ferrum
	git clone https://github.com/Geplauder/ferrum.git ferrum

	echo "Ferrum cloned successfully, initializing database..."

        cd ./ferrum/ferrum-db/
        sqlx database create
        sqlx migrate run

	echo "Ferrum database initialized."
	cd ../..

	echo "Successfully initialized Ferrum."
else
	echo "Found existing Ferrum directory, skipping..."
fi

if [ ! -d "./oxygen/.git" ]; then
	echo "Oxygen not found, cloning..."
	rm -r oxygen
	git clone https://github.com/Geplauder/oxygen.git oxygen

	echo "Oxygen cloned successfully, installing npm packages..."

	cd ./oxygen
	npm i

	cp /workspace/.env.oxygen .env.local

	echo "Oxygen npm packages successfully installed."
	cd ./..

	echo "Successfully initialized Oxygen."
else
	echo "Found existing Oxygen directory, skipping..."
fi

echo "Fixing cargo permissions..."
sudo chmod -R g+rw /usr/local/cargo
echo "Cargo permissions fixed."

echo "Repositories successfully initialized"
