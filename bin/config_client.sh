bin/fetch.sh $1 ca.crt "$2"
bin/fetch.sh $1 client1.crt "$2"
bin/fetch.sh $1 client1.key "$2"
bin/fetch.sh $1 server.crt "$2"
bin/fetch.sh $1 ta.key "$2"

cp etc/template.ovpn "$2/DO.ovpn"
sed -i -e "s/my-server/$1/g" "$2/DO.ovpn"
rm "$2/DO.ovpn-e"

#open "$2"
