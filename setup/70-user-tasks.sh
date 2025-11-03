

# Enable the fstrim.timer service to run automatically on boot.
sudo systemctl enable fstrim.timer
sudo systemctl start fstrim.timer

#richard needs to change based on the username
sudo systemctl start syncthing@richard.service
sudo systemctl enable syncthing@richard.service



echo "All done!"

