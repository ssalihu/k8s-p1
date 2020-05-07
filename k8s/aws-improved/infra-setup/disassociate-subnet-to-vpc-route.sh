if [ "$#" -ne 2 ];
then
   echo "Usage error: Parameters are <ROUTE-TABLE-ID> <SUBNET-ID>"
   exit
fi

aws ec2 disassociate-route-table --route-table-id $1 --subnet-id $2

