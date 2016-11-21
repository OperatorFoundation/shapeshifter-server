bin/fetch.sh $1 ca.crt
bin/fetch.sh $1 client1.crt
bin/fetch.sh $1 client1.key
bin/fetch.sh $1 server.crt
bin/fetch.sh $1 ta.key

cp etc/template.ovpn DO.tblk/DO.ovpn
sed -i -e 's/my-server/$1/g' DO.tblk/DO.ovpn

open DO.tblk
