echo ">>>>Make file executable"
chmod +x /etc/init.d/dispatcher

echo ">>>Start the dispatcher"
/etc/init.d/dispatcher start

echo ">>> Sleeping"
sleep 5

echo "<<<<End of start_shapeshifter-dispatcher.sh"
