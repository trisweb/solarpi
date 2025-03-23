#!/bin/bash

echo "Deploying solarpi!"

echo "Installing refresh-camera script..."
mkdir -p $HOME/bin
cp ./bin/* $HOME/bin

echo "Copying web root files..."
sudo mkdir -p /var/www
sudo cp -r ./www-root/* /var/www/
sudo chown -R $USER:www-data /var/www/

echo "Setting up cron job for refresh-camera..."
echo "* * * * * root $HOME/bin/refresh-camera > /dev/null 2>&1" | sudo tee /etc/cron.d/solarpi > /dev/null

echo "Done!"
