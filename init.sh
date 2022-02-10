#!/bin/bash

echo "Initializing repositories..."

if [ ! -d "./ferrum" ]; then
	echo "Ferrum not found, cloning..."

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

if [ ! -d "./oxygen" ]; then
	echo "Oxygen not found, cloning..."
	git clone https://github.com/Geplauder/oxygen.git oxygen
	echo "Oxygen cloned successfully"
else
	echo "Found existing Oxygen directory, skipping..."
fi

echo "Repositories successfully initialized, sleeping..."

sleep infinity
