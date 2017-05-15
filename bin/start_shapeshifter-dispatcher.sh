service supervisor restart
sleep 5
CERT=`cat /root/go/state/obfs4_bridgeline.txt | grep "^Bridge" | sed "s/=/ /g" | awk '{print $7}'`
echo $CERT
echo "{---cert---: ---$CERT---, ---iatMode---: ---0---}" | sed 's/---/"/g' >/root/ca/keys/obfs4.json
