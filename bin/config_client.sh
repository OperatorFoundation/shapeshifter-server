bin/fetch.sh $1 ca.crt
bin/fetch.sh $1 client1.crt
bin/fetch.sh $1 client1.key
bin/fetch.sh $1 server.crt
bin/fetch.sh $1 ta.key

cp etc/template.ovpn DO.tblk/DO.ovpn
rpl my-server $1 DO.tblk/DO.ovpn

open DO.tblk
