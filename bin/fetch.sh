echo "scp -i ~/.ssh/id_ecdsa -B -o StrictHostKeyChecking=no root@$1:ca/keys/$2 $3/$2"
scp -i ~/.ssh/id_ecdsa -B -o StrictHostKeyChecking=no root@$1:ca/keys/$2 $3/$2
